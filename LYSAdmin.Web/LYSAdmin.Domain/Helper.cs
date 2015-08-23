using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Web;


namespace LYSAdmin.Domain
{
    public class Helper
    {
        public byte[] GetBytes(HttpPostedFileBase file)
        {
            MemoryStream target = new MemoryStream();
            if (file != null && file.ContentLength > 0)
            {
                file.InputStream.CopyTo(target);

                string fileExtension = Path.GetExtension(file.FileName).ToLower();
                if (fileExtension == ".jpg" ||
                    fileExtension == ".png" ||
                    fileExtension == ".gif" ||
                    fileExtension == ".jpeg" ||
                    fileExtension == ".tif" ||
                    fileExtension == ".bmp")
                {
                    return target.ToArray();
                }
            }
            return null;
        }

        public byte[] GetImageByte(Stream fileStream)
        {
            int targetWidth = 1000;
            int targetHeight = 1500;
            using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(fileStream))
            {
                Size newSize = CalculateDimensions(oldImage.Size, targetWidth, targetHeight);
                var newImage = new Bitmap(newSize.Width, newSize.Height);
                using (Graphics canvas = Graphics.FromImage(newImage))
                {
                    canvas.CompositingQuality = CompositingQuality.HighQuality;
                    canvas.SmoothingMode = SmoothingMode.HighQuality;
                    canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    canvas.DrawImage(oldImage, 0, 0, newSize.Width, newSize.Height);
                    MemoryStream m = new MemoryStream();
                    newImage.Save(m, oldImage.RawFormat);
                    return m.GetBuffer();
                }
            }
        }

        private Size CalculateDimensions(Size oldSize, int targetWidth, int targetHeight)
        {
            Size newSize = new Size();
            if (oldSize.Height <= targetHeight && oldSize.Width <= targetWidth)
            {
                newSize.Height = oldSize.Height;
                newSize.Width = oldSize.Width;
            }
            else
            {
                float requiredRatio = (float)targetHeight / (float)targetWidth;
                var newRatio = 0.0;

                if ((float)oldSize.Height / (float)oldSize.Width > requiredRatio)
                {
                    newRatio = (float)targetHeight / (float)oldSize.Height;

                }
                else
                {
                    newRatio = (float)targetWidth / (float)oldSize.Width;
                }
                newSize.Height = (int)(newRatio * oldSize.Height);
                newSize.Width = (int)(newRatio * oldSize.Width);
            }

            return newSize;
        }

       
    }
}
