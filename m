Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720519646F
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 09:28:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C1463C326C
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 09:28:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DBBA23C3250
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 09:28:24 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A2BC600BE9
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 09:28:22 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id h8so5851956pgs.9
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVFttMIv96oc2EzvMW2TXOyRGJq1VAJqP5R9JmolxiM=;
 b=KVNmE9/Kcq5kk3dHfR+YUegDHWZyPbtqt3ARvYB28FI7OfJKB0tu7a62FyYmZdWyQg
 h3bbQ7PJy4IGmi+47G+4SWADg4T8uu5xfYtWJPi1Nku3renICbEF+fod5T9eidLVXEkj
 xdVY0BvCasHIour5FlzO2DkAK2YiCel3TNzgvL5lhmNDh4nD26p0YN1cIo9B//IDYur/
 eDCSw57jskBLER1HeFK1YkCQMdmhTGqyF429jO3xTf7Zb8F8wbIOomkFN8DpfgCnkQ8n
 FGjYV3eheCYebREzZvb6Dy+H2jiGDILBCRI3GTGmsZHC1EakvvEHOooDCTt1aUxqgRQF
 Qtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVFttMIv96oc2EzvMW2TXOyRGJq1VAJqP5R9JmolxiM=;
 b=cPHB4C0tb8N56ELnagozySsauZkE4sd8Ey9T1ULJgIfHM8VtmA1DyPXNBrvVatBJ0v
 dkI7FyunInVrJ4ica2xWQ9xJBP6QC76oSaTE9NSCmUQaCjQCgkpxuRl9eoeMmniWdOMo
 QgFLoV4rH7qIlxV+6x12z0MI1/77hLWKlNbk1TIszDJThuuOdTLh/ii/1Gb1JyHFwBFk
 ru2RqaxcpUejMSkpOl/DrSaWLLEmVaLlql/VD/GJkTfmg3prPHAtjT2Gj3pUWm+ZASqQ
 Uwi20XhNHa8UduiX+48KjAQyVxwPx9To9cV9yybNYHWeOHZZdytfihHPBhXhYkAzY0/p
 khUA==
X-Gm-Message-State: ANhLgQ3CKi0981kZXgtZo7mOAVxNwz2OjQEJrYWrVwdYQNrVy2YSzZZD
 TFeBvJ61IydcYH44eTw+DfF4hRJPmUt/0f77ldI=
X-Google-Smtp-Source: ADFU+vsr7CDn8+vX6UcdMrLW/hCdTpRcSClS8jPxC8bUogYCW/EbtBPfHD0l2vPaCgsBzoW0vEIUHailQQns6OY9eQE=
X-Received: by 2002:aa7:9f11:: with SMTP id g17mr3340225pfr.224.1585384100804; 
 Sat, 28 Mar 2020 01:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
In-Reply-To: <20200327134707.4532-3-chrubis@suse.cz>
From: Cixi Geng <gengcixi@gmail.com>
Date: Sat, 28 Mar 2020 16:27:44 +0800
Message-ID: <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] device_drivers/uart01: Add uart01 test
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Orson Zhai <orsonzhai@gmail.com>, Carlos Hernandez <ceh@ti.com>,
 ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0371215828=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0371215828==
Content-Type: multipart/alternative; boundary="000000000000293d7105a1e60079"

--000000000000293d7105a1e60079
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril:
Thank you porting the serialcheck.c into LTP
I am sorry to find the serialcheck have not LOOPBACK mode support
the LOOPBACK mode is a better test than HW flow , because most machine's
uart have not connect the Rx & TX
in LOOPBACK mode. we test the uart port directly, So we can test one uart
port Rx and Tx functions at the same time .
here is the diff  serialcheck with loopback patch
So I'd prefer use loopback mode test the uart in case.
$ diff serialcheck.c serialcheck-with-loopback.c
14a15,16
> #define TIOCM_LOOP    0x8000
>
42a45
>     unsigned char loopback;
53a57
>     {"loopback",    'k', NULL,   0, "loopback mode", 0},
69a74
>         go->loopback =3D 0;
115a121,123
>     case 'k':
>         go->loopback =3D 1;
>         break;
316c324
<         ret =3D poll(&pfd, 1, 10 * 1000);
---
>         ret =3D poll(&pfd, 1, 100 * 1000);
421a430
>     unsigned int mcr;
489a499,511
>     if (opts.loopback) {
>         ret =3D ioctl(fd, TIOCMGET, &mcr);
>         if (ret < 0)
>             die("mcr get failed: %m\n");
>
>         mcr |=3D TIOCM_LOOP;
>
>         ret =3D ioctl(fd, TIOCMSET, &mcr);
>         if (ret < 0)
>             die ("mcr set failed: %m\n");
>
>     }
>
514a537,542
>     if(opts.loopback){
>         mcr &=3D ~(TIOCM_LOOP);
>         ret =3D ioctl(fd,TIOCMSET,&mcr);
>     }
>     if(ret)
>         printf("disabling loopback failed:%m\n");


Cyril Hrubis <chrubis@suse.cz> =E4=BA=8E2020=E5=B9=B43=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:47=E5=86=99=E9=81=93=EF=BC=9A

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/kernel_misc                           |   5 +
>  .../kernel/device-drivers/uart/.gitignore     |   1 +
>  testcases/kernel/device-drivers/uart/Makefile |   4 +
>  testcases/kernel/device-drivers/uart/uart01.c | 522 ++++++++++++++++++
>  4 files changed, 532 insertions(+)
>  create mode 100644 testcases/kernel/device-drivers/uart/.gitignore
>  create mode 100644 testcases/kernel/device-drivers/uart/Makefile
>  create mode 100644 testcases/kernel/device-drivers/uart/uart01.c
>
> diff --git a/runtest/kernel_misc b/runtest/kernel_misc
> index 7937c7bbf..a7f1d9b56 100644
> --- a/runtest/kernel_misc
> +++ b/runtest/kernel_misc
> @@ -13,3 +13,8 @@ zram01 zram01.sh
>  zram02 zram02.sh
>  zram03 zram03
>  umip_basic_test umip_basic_test
> +uart01_9600 uart01 -b 9600
> +uart01_19200 uart01 -b 19200
> +uart01_38400 uart01 -b 38400
> +uart01_57600 uart01 -b 57600
> +uart01_115200 uart01 -b 115200
> diff --git a/testcases/kernel/device-drivers/uart/.gitignore
> b/testcases/kernel/device-drivers/uart/.gitignore
> new file mode 100644
> index 000000000..9333e8db9
> --- /dev/null
> +++ b/testcases/kernel/device-drivers/uart/.gitignore
> @@ -0,0 +1 @@
> +uart01
> diff --git a/testcases/kernel/device-drivers/uart/Makefile
> b/testcases/kernel/device-drivers/uart/Makefile
> new file mode 100644
> index 000000000..1c90e5cd6
> --- /dev/null
> +++ b/testcases/kernel/device-drivers/uart/Makefile
> @@ -0,0 +1,4 @@
> +
> +top_srcdir     ?=3D ../../../..
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/device-drivers/uart/uart01.c
> b/testcases/kernel/device-drivers/uart/uart01.c
> new file mode 100644
> index 000000000..4647c55e3
> --- /dev/null
> +++ b/testcases/kernel/device-drivers/uart/uart01.c
> @@ -0,0 +1,522 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> +   Copyright (c) 2014 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +   Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
> +
> + */
> +
> +#include <stdio.h>
> +#include <ctype.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <termios.h>
> +#include <stdarg.h>
> +#include <unistd.h>
> +#include <sys/mman.h>
> +#include <stdint.h>
> +#include <poll.h>
> +#include <sys/ioctl.h>
> +#include <linux/serial.h>
> +
> +#include "tst_test.h"
> +
> +static const char hex_asc[] =3D "0123456789abcdef";
> +#define hex_asc_lo(x)  hex_asc[((x) & 0x0f)]
> +#define hex_asc_hi(x)  hex_asc[((x) & 0xf0) >> 4]
> +
> +struct g_opt {
> +       char *uart_dev;
> +       char *file_trans;
> +       int baud_rate;
> +       unsigned int loops;
> +       unsigned char hwflow;
> +       unsigned char do_termios;
> +#define MODE_TX_ONLY    (1 << 0)
> +#define MODE_RX_ONLY    (1 << 1)
> +#define MODE_DUPLEX     (MODE_TX_ONLY | MODE_RX_ONLY)
> +       unsigned int mode;
> +       unsigned char *cmp_buff;
> +};
> +
> +static int vscnprintf(char *buf, size_t size, const char *fmt, va_list
> args)
> +{
> +       int i;
> +
> +       i =3D vsnprintf(buf, size, fmt, args);
> +
> +       if (i < (int)size)
> +               return i;
> +       if (size !=3D 0)
> +               return size - 1;
> +       return 0;
> +}
> +
> +static int scnprintf(char *buf, size_t size, const char *fmt, ...)
> +{
> +       va_list args;
> +       int i;
> +
> +       va_start(args, fmt);
> +       i =3D vscnprintf(buf, size, fmt, args);
> +       va_end(args);
> +
> +       return i;
> +}
> +
> +
> +static void hex_dump_to_buffer(const void *buf, int len, int rowsize,
> +               int groupsize, char *linebuf, int linebuflen, int ascii)
> +{
> +       const uint8_t *ptr =3D buf;
> +       uint8_t ch;
> +       int j, lx =3D 0;
> +       int ascii_column;
> +
> +       if (rowsize !=3D 16 && rowsize !=3D 32)
> +               rowsize =3D 16;
> +
> +       if (!len)
> +               goto nil;
> +       if (len > rowsize)      /* limit to one line at a time */
> +               len =3D rowsize;
> +       if ((len % groupsize) !=3D 0)     /* no mixed size output */
> +               groupsize =3D 1;
> +
> +       switch (groupsize) {
> +       case 8: {
> +               const uint64_t *ptr8 =3D buf;
> +               int ngroups =3D len / groupsize;
> +
> +               for (j =3D 0; j < ngroups; j++)
> +                       lx +=3D scnprintf(linebuf + lx, linebuflen - lx,
> +                                       "%s%16.16llx", j ? " " : "",
> +                                       (unsigned long long)*(ptr8 + j));
> +               ascii_column =3D 17 * ngroups + 2;
> +               break;
> +               }
> +
> +       case 4: {
> +               const uint32_t *ptr4 =3D buf;
> +               int ngroups =3D len / groupsize;
> +
> +               for (j =3D 0; j < ngroups; j++)
> +                       lx +=3D scnprintf(linebuf + lx, linebuflen - lx,
> +                                       "%s%8.8x", j ? " " : "", *(ptr4 +
> j));
> +               ascii_column =3D 9 * ngroups + 2;
> +               break;
> +               }
> +
> +       case 2: {
> +               const uint16_t *ptr2 =3D buf;
> +               int ngroups =3D len / groupsize;
> +
> +               for (j =3D 0; j < ngroups; j++)
> +                       lx +=3D scnprintf(linebuf + lx, linebuflen - lx,
> +                                       "%s%4.4x", j ? " " : "", *(ptr2 +
> j));
> +               ascii_column =3D 5 * ngroups + 2;
> +               break;
> +               }
> +
> +       default:
> +               for (j =3D 0; (j < len) && (lx + 3) <=3D linebuflen; j++)=
 {
> +                       ch =3D ptr[j];
> +                       linebuf[lx++] =3D hex_asc_hi(ch);
> +                       linebuf[lx++] =3D hex_asc_lo(ch);
> +                       linebuf[lx++] =3D ' ';
> +                       if (j =3D=3D 7)
> +                               linebuf[lx++] =3D ' ';
> +               }
> +               if (j)
> +                       lx--;
> +
> +               ascii_column =3D 3 * rowsize + 2 + 2;
> +               break;
> +       }
> +       if (!ascii)
> +               goto nil;
> +
> +       while (lx < (linebuflen - 1) && lx < (ascii_column - 1))
> +               linebuf[lx++] =3D ' ';
> +       for (j =3D 0; (j < len) && (lx + 2) < linebuflen; j++) {
> +               ch =3D ptr[j];
> +               linebuf[lx++] =3D (isascii(ch) && isprint(ch)) ? ch : '.'=
;
> +       }
> +nil:
> +       linebuf[lx++] =3D '\0';
> +}
> +
> +static void print_hex_dump(const void *buf, int len, int offset)
> +{
> +       const uint8_t *ptr =3D buf;
> +       int i, linelen, remaining =3D len;
> +       char linebuf[32 * 3 + 2 + 32 + 2 + 1];
> +       int rowsize =3D 16;
> +       int groupsize =3D 1;
> +
> +       if (rowsize !=3D 16 && rowsize !=3D 32)
> +               rowsize =3D 16;
> +
> +       for (i =3D 0; i < len; i +=3D rowsize) {
> +               linelen =3D MIN(remaining, rowsize);
> +               remaining -=3D rowsize;
> +
> +               hex_dump_to_buffer(ptr + i, linelen, rowsize, groupsize,
> +                               linebuf, sizeof(linebuf), 1);
> +
> +               printf("%.8x: %s\n", i + offset, linebuf);
> +       }
> +}
> +
> +static int stress_test_uart_once(struct g_opt *opts, int fd, unsigned
> char *data,
> +               off_t data_len)
> +{
> +       unsigned char *cmp_data =3D opts->cmp_buff;
> +       ssize_t size;
> +       int wait_rx;
> +       int wait_tx;
> +       ssize_t progress_rx =3D 0;
> +       ssize_t progress_tx =3D 0;
> +       unsigned int reads =3D 0;
> +       unsigned int writes =3D 0;
> +
> +       do {
> +               struct pollfd pfd =3D {
> +                       .fd =3D fd,
> +               };
> +               int ret;
> +
> +               if (opts->mode & MODE_RX_ONLY && progress_rx < data_len) =
{
> +                       pfd.events |=3D POLLIN;
> +                       wait_rx =3D 1;
> +               } else {
> +                       wait_rx =3D 0;
> +               }
> +
> +               if (opts->mode & MODE_TX_ONLY && progress_tx < data_len) =
{
> +                       pfd.events |=3D POLLOUT;
> +                       wait_tx =3D 1;
> +               } else {
> +                       wait_tx =3D 0;
> +               }
> +
> +               ret =3D poll(&pfd, 1, 10 * 1000);
> +               if (ret =3D=3D 0) {
> +                       tst_res(TFAIL, "timeout, RX/TX: %zd/%zd\n",
> progress_rx, progress_tx);
> +                       break;
> +               }
> +               if (ret < 0) {
> +                       tst_res(TFAIL | TERRNO, "poll() failed");
> +                       return 1;
> +               }
> +
> +               if (pfd.revents & POLLIN) {
> +                       size =3D read(fd, cmp_data + progress_rx, data_le=
n -
> progress_rx);
> +                       if (size < 0) {
> +                               tst_res(TFAIL | TERRNO, "read() failed");
> +                               return 1;
> +                       }
> +                       reads++;
> +                       progress_rx +=3D size;
> +                       if (progress_rx >=3D data_len)
> +                               wait_rx =3D 0;
> +               }
> +
> +               if (pfd.revents & POLLOUT) {
> +
> +                       size =3D write(fd, data + progress_tx, data_len -
> progress_tx);
> +                       if (size < 0) {
> +                               tst_res(TFAIL | TERRNO, "write() failed")=
;
> +                               return 1;
> +                       }
> +                       writes++;
> +                       progress_tx +=3D size;
> +                       if (progress_tx >=3D data_len)
> +                               wait_tx =3D 0;
> +               }
> +       } while (wait_rx || wait_tx);
> +
> +       tst_res(TINFO, "Needed %u reads %u writes ", reads, writes);
> +
> +       if (opts->mode & MODE_RX_ONLY) {
> +               unsigned int i;
> +               int found =3D 0;
> +               unsigned int min_pos;
> +               unsigned int max_pos;
> +
> +               if (!memcmp(data, cmp_data, data_len)) {
> +                       tst_res(TPASS, "RX passed");
> +                       return 0;
> +               }
> +
> +               for (i =3D 0; i < data_len && !found; i++) {
> +                       if (data[i] !=3D cmp_data[i]) {
> +                               found =3D 1;
> +                               break;
> +                       }
> +               }
> +
> +               if (!found) {
> +                       tst_res(TFAIL, "memcmp() didn't match but manual
> cmp did");
> +                       return 1;
> +               }
> +
> +               max_pos =3D (i & ~0xfULL) + 16 * 3;
> +               if (max_pos > data_len)
> +                       max_pos =3D data_len;
> +
> +               min_pos =3D i & ~0xfULL;
> +               if (min_pos > 16 * 3)
> +                       min_pos -=3D 16 * 3;
> +               else
> +                       min_pos =3D 0;
> +
> +               tst_res(TFAIL, "Oh oh, inconsistency at pos %d (0x%x)", i=
,
> i);
> +
> +               printf("\nOriginal sample:\n");
> +               print_hex_dump(data + min_pos, max_pos - min_pos, min_pos=
);
> +
> +               printf("\nReceived sample:\n");
> +               print_hex_dump(cmp_data + min_pos, max_pos - min_pos,
> min_pos);
> +               return 1;
> +       }
> +
> +       if (opts->mode & MODE_TX_ONLY)
> +               tst_res(TPASS, "TX passed");
> +
> +       return 0;
> +}
> +
> +static int stress_test_uart(struct g_opt *opts, int fd, unsigned char
> *data, off_t data_len)
> +{
> +       unsigned int loops =3D 0;
> +       int status;
> +
> +       opts->cmp_buff =3D SAFE_MALLOC(data_len);
> +       memset(opts->cmp_buff, 0, data_len);
> +
> +       do {
> +               status =3D stress_test_uart_once(opts, fd, data, data_len=
);
> +               memset(opts->cmp_buff, 0, data_len);
> +       } while (++loops < opts->loops && !status);
> +
> +       free(opts->cmp_buff);
> +
> +       return status;
> +}
> +
> +static int setup_uart(struct g_opt *opts, int open_mode, struct termios
> *old_term)
> +{
> +       struct termios new_term;
> +       int fd;
> +       int ret;
> +
> +       tst_res(TINFO, "Setting up %s speed %u hwflow=3D%u",
> +               opts->uart_dev, opts->baud_rate, opts->hwflow);
> +
> +       fd =3D SAFE_OPEN(opts->uart_dev, open_mode | O_NONBLOCK);
> +
> +       ret =3D tcgetattr(fd, old_term);
> +       if (ret < 0)
> +               tst_brk(TBROK, "tcgetattr() failed: %m\n");
> +
> +       new_term =3D *old_term;
> +
> +       /* or c_cflag |=3D BOTHER and c_ospeed for any speed */
> +       ret =3D cfsetspeed(&new_term, opts->baud_rate);
> +       if (ret < 0)
> +               tst_brk(TBROK, "cfsetspeed(, %u) failed %m\n",
> opts->baud_rate);
> +       cfmakeraw(&new_term);
> +       new_term.c_cflag |=3D CREAD;
> +       if (opts->hwflow)
> +               new_term.c_cflag |=3D CRTSCTS;
> +       else
> +               new_term.c_cflag &=3D ~CRTSCTS;
> +       new_term.c_cc[VMIN] =3D 64;
> +       new_term.c_cc[VTIME] =3D 8;
> +
> +       ret =3D tcsetattr(fd, TCSANOW, &new_term);
> +       if (ret < 0)
> +               tst_brk(TBROK, "tcsetattr failed: %m\n");
> +
> +       if (opts->do_termios) {
> +               ret =3D tcflush(fd, TCIFLUSH);
> +               if (ret < 0)
> +                       tst_brk(TBROK, "tcflush failed: %m\n");
> +       }
> +
> +       ret =3D fcntl(fd, F_SETFL, 0);
> +       if (ret)
> +               printf("Failed to remove nonblock mode\n");
> +
> +       return fd;
> +}
> +
> +static void restore_uart(int fd, struct termios *old_term)
> +{
> +       int ret =3D tcsetattr(fd, TCSAFLUSH, old_term);
> +       if (ret)
> +               printf("tcsetattr() of old ones failed: %m\n");
> +}
> +
> +static void print_counters(const char *prefix,
> +                           struct serial_icounter_struct *old,
> +                           struct serial_icounter_struct *new)
> +{
> +#define CNT(x) (new->x - old->x)
> +       printf("%scts: %d dsr: %d rng: %d dcd: %d rx: %d tx: %d "
> +               "frame %d ovr %d par: %d brk: %d buf_ovrr: %d\n", prefix,
> +               CNT(cts), CNT(dsr), CNT(rng), CNT(dcd), CNT(rx),
> +               CNT(tx), CNT(frame), CNT(overrun), CNT(parity),
> +               CNT(brk), CNT(buf_overrun));
> +#undef CNT
> +}
> +
> +static struct g_opt opts =3D {
> +       .baud_rate =3D 115200,
> +       .loops =3D 1,
> +       .do_termios =3D 1,
> +};
> +
> +static char *uart_rx;
> +static char *uart_tx;
> +
> +unsigned char *data;
> +static long data_len;
> +
> +void run(void)
> +{
> +       struct serial_icounter_struct old_counters;
> +       struct serial_icounter_struct new_counters;
> +       int ret, fd_rx, fd_tx;
> +       struct termios old_term_rx, old_term_tx;
> +
> +       struct g_opt opts_in =3D opts;
> +       struct g_opt opts_out =3D opts;
> +
> +       opts_in.uart_dev =3D uart_rx;
> +       opts_out.uart_dev =3D uart_tx;
> +
> +       opts_in.mode =3D MODE_RX_ONLY;
> +       opts_out.mode =3D MODE_TX_ONLY;
> +
> +       fd_rx =3D setup_uart(&opts_in, O_RDONLY, &old_term_rx);
> +
> +       if (!strcmp(uart_rx, uart_tx))
> +               fd_tx =3D SAFE_OPEN(uart_tx, O_WRONLY);
> +       else
> +               fd_tx =3D setup_uart(&opts_out, O_WRONLY, &old_term_tx);
> +
> +       if (!SAFE_FORK()) {
> +               ioctl(fd_rx, TIOCGICOUNT, &old_counters);
> +               stress_test_uart(&opts_in, fd_rx, data, data_len);
> +               ret =3D ioctl(fd_rx, TIOCGICOUNT, &new_counters);
> +               if (ret > 0)
> +                       print_counters("RX:", &old_counters,
> &new_counters);
> +               exit(0);
> +       }
> +
> +       if (!SAFE_FORK()) {
> +               ioctl(fd_tx, TIOCGICOUNT, &old_counters);
> +               stress_test_uart(&opts_out, fd_tx, data, data_len);
> +               ret =3D ioctl(fd_tx, TIOCGICOUNT, &new_counters);
> +               if (ret > 0)
> +                       print_counters("TX:", &old_counters,
> &new_counters);
> +               exit(0);
> +       }
> +
> +       SAFE_WAIT(NULL);
> +       SAFE_WAIT(NULL);
> +
> +       restore_uart(fd_rx, &old_term_rx);
> +
> +       if (strcmp(uart_rx, uart_tx))
> +               restore_uart(fd_tx, &old_term_tx);
> +
> +       close(fd_rx);
> +       close(fd_tx);
> +}
> +
> +static void map_file(const char *fname)
> +{
> +       struct stat st;
> +       int fd;
> +
> +       fd =3D SAFE_OPEN(fname, O_RDONLY);
> +
> +       SAFE_FSTAT(fd, &st);
> +
> +       data_len =3D st.st_size;
> +
> +       data =3D SAFE_MMAP(NULL, data_len, PROT_READ,
> +                        MAP_SHARED | MAP_LOCKED | MAP_POPULATE, fd, 0);
> +
> +       tst_res(TINFO, "Mapped file '%s' size %li bytes", fname, data_len=
);
> +
> +       SAFE_CLOSE(fd);
> +}
> +
> +static void map_buffer(long buf_size)
> +{
> +       size_t i;
> +
> +       data_len =3D buf_size;
> +
> +       data =3D SAFE_MMAP(NULL, data_len, PROT_READ | PROT_WRITE,
> +                        MAP_ANONYMOUS | MAP_SHARED | MAP_LOCKED, -1, 0);
> +
> +       long *p =3D (void*)data;
> +
> +       srandom(time(NULL));
> +
> +       for (i =3D 0; i < data_len / sizeof(long); i++)
> +               p[i] =3D random();
> +
> +       tst_res(TINFO, "Mapped anynymous memory size %li bytes", data_len=
);
> +}
> +
> +static char *baud_rate;
> +static char *hwflow;
> +static char *fname;
> +static char *buf_size;
> +
> +static void setup(void)
> +{
> +       long size =3D 1024;
> +
> +       if (baud_rate)
> +               tst_parse_int(baud_rate, &(opts.baud_rate), 0, INT_MAX);
> +
> +       if (hwflow)
> +               opts.hwflow =3D 1;
> +
> +       if (fname && buf_size)
> +               tst_brk(TBROK, "Only one of -f and -s could be set!");
> +
> +       if (buf_size)
> +               tst_parse_long(buf_size, &size, 0, LONG_MAX);
> +
> +       uart_rx =3D getenv("UART_RX");
> +       uart_tx =3D getenv("UART_TX");
> +
> +       if (fname)
> +               map_file(fname);
> +       else
> +               map_buffer(size);
> +}
> +
> +static struct tst_test test =3D {
> +       .setup =3D setup,
> +       .test_all =3D run,
> +       .options =3D (struct tst_option[]) {
> +               {"b:", &baud_rate, "-b       Baud rate (9600, ...)"},
> +               {"w",  &hwflow   , "-w       Enable hwflow (RTS/CTS)"},
> +               {"f:",  &fname,    "-f       Binary file for transfers"},
> +               {"s:",  &buf_size, "-s       Binary buffer size"},
> +               {}
> +       },
> +       .needs_devices =3D (const char *const[]) {"UART_RX", "UART_TX",
> NULL},
> +       .forks_child =3D 1,
> +};
> --
> 2.24.1
>
>

--000000000000293d7105a1e60079
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgQ3lyaWw6PGRpdj5UaGFuayB5b3UgcG9ydGluZyB0aGUgc2VyaWFs
Y2hlY2suYyBpbnRvIExUUDwvZGl2PjxkaXY+SSBhbSBzb3JyeSB0byBmaW5kIHRoZSBzZXJpYWxj
aGVjayBoYXZlIG5vdCBMT09QQkFDSyBtb2RlIHN1cHBvcnQ8L2Rpdj48ZGl2PnRoZSBMT09QQkFD
SyBtb2RlIGlzIGEgYmV0dGVyIHRlc3QgdGhhbiBIVyBmbG93ICwgYmVjYXVzZSBtb3N0IG1hY2hp
bmUmIzM5O3MgdWFydCBoYXZlIG5vdCBjb25uZWN0IHRoZSBSeCAmYW1wOyBUWDwvZGl2PjxkaXY+
aW4gTE9PUEJBQ0sgbW9kZS4gd2UgdGVzdCB0aGUgdWFydCBwb3J0IGRpcmVjdGx5LCBTbyB3ZSBj
YW4gdGVzdCBvbmUgdWFydCBwb3J0IFJ4IGFuZCBUeCBmdW5jdGlvbnMgYXQgdGhlIHNhbWUgdGlt
ZSAuPC9kaXY+PGRpdj5oZXJlIGlzIHRoZSBkaWZmwqAgc2VyaWFsY2hlY2sgd2l0aCBsb29wYmFj
ayBwYXRjaDwvZGl2PjxkaXY+U28gSSYjMzk7ZCBwcmVmZXIgdXNlIGxvb3BiYWNrIG1vZGUgdGVz
dCB0aGUgdWFydCBpbiBjYXNlLjwvZGl2PjxkaXY+PGgzIGNsYXNzPSJnbWFpbC1pdyIgc3R5bGU9
Im92ZXJmbG93OmhpZGRlbjt3aGl0ZS1zcGFjZTpub3dyYXA7Zm9udC1zaXplOjAuNzVyZW07Zm9u
dC13ZWlnaHQ6aW5oZXJpdDttYXJnaW46aW5oZXJpdDt0ZXh0LW92ZXJmbG93OmVsbGlwc2lzO2Zv
bnQtZmFtaWx5OlJvYm90byxSb2JvdG9EcmFmdCxIZWx2ZXRpY2EsQXJpYWwsc2Fucy1zZXJpZjts
ZXR0ZXItc3BhY2luZzowLjNweDtjb2xvcjpyZ2IoOTUsOTksMTA0KTtsaW5lLWhlaWdodDoyMHB4
Ij4kIGRpZmYgc2VyaWFsY2hlY2suYyBzZXJpYWxjaGVjay13aXRoLWxvb3BiYWNrLmM8YnI+MTRh
MTUsMTY8YnI+Jmd0OyAjZGVmaW5lIFRJT0NNX0xPT1AgwqAgwqAweDgwMDA8YnI+Jmd0Ozxicj40
MmE0NTxicj4mZ3Q7IMKgIMKgIHVuc2lnbmVkIGNoYXIgbG9vcGJhY2s7PGJyPjUzYTU3PGJyPiZn
dDsgwqAgwqAgeyZxdW90O2xvb3BiYWNrJnF1b3Q7LCDCoCDCoCYjMzk7ayYjMzk7LCBOVUxMLCDC
oCAwLCAmcXVvdDtsb29wYmFjayBtb2RlJnF1b3Q7LCAwfSw8YnI+NjlhNzQ8YnI+Jmd0OyDCoCDC
oCDCoCDCoCBnby0mZ3Q7bG9vcGJhY2sgPSAwOzxicj4xMTVhMTIxLDEyMzxicj4mZ3Q7IMKgIMKg
IGNhc2UgJiMzOTtrJiMzOTs6PGJyPiZndDsgwqAgwqAgwqAgwqAgZ28tJmd0O2xvb3BiYWNrID0g
MTs8YnI+Jmd0OyDCoCDCoCDCoCDCoCBicmVhazs8YnI+MzE2YzMyNDxicj4mbHQ7IMKgIMKgIMKg
IMKgIHJldCA9IHBvbGwoJmFtcDtwZmQsIDEsIDEwICogMTAwMCk7PGJyPi0tLTxicj4mZ3Q7IMKg
IMKgIMKgIMKgIHJldCA9IHBvbGwoJmFtcDtwZmQsIDEsIDEwMCAqIDEwMDApOzxicj40MjFhNDMw
PGJyPiZndDsgwqAgwqAgdW5zaWduZWQgaW50IG1jcjs8YnI+NDg5YTQ5OSw1MTE8YnI+Jmd0OyDC
oCDCoCBpZiAob3B0cy5sb29wYmFjaykgezxicj4mZ3Q7IMKgIMKgIMKgIMKgIHJldCA9IGlvY3Rs
KGZkLCBUSU9DTUdFVCwgJmFtcDttY3IpOzxicj4mZ3Q7IMKgIMKgIMKgIMKgIGlmIChyZXQgJmx0
OyAwKTxicj4mZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIGRpZSgmcXVvdDttY3IgZ2V0IGZhaWxlZDog
JW1cbiZxdW90Oyk7PGJyPiZndDs8YnI+Jmd0OyDCoCDCoCDCoCDCoCBtY3IgfD0gVElPQ01fTE9P
UDs8YnI+Jmd0Ozxicj4mZ3Q7IMKgIMKgIMKgIMKgIHJldCA9IGlvY3RsKGZkLCBUSU9DTVNFVCwg
JmFtcDttY3IpOzxicj4mZ3Q7IMKgIMKgIMKgIMKgIGlmIChyZXQgJmx0OyAwKTxicj4mZ3Q7IMKg
IMKgIMKgIMKgIMKgIMKgIGRpZSAoJnF1b3Q7bWNyIHNldCBmYWlsZWQ6ICVtXG4mcXVvdDspOzxi
cj4mZ3Q7PGJyPiZndDsgwqAgwqAgfTxicj4mZ3Q7PGJyPjUxNGE1MzcsNTQyPGJyPiZndDsgwqAg
wqAgaWYob3B0cy5sb29wYmFjayl7PGJyPiZndDsgwqAgwqAgwqAgwqAgbWNyICZhbXA7PSB+KFRJ
T0NNX0xPT1ApOzxicj4mZ3Q7IMKgIMKgIMKgIMKgIHJldCA9IGlvY3RsKGZkLFRJT0NNU0VULCZh
bXA7bWNyKTs8YnI+Jmd0OyDCoCDCoCB9PGJyPiZndDsgwqAgwqAgaWYocmV0KTxicj4mZ3Q7IMKg
IMKgIMKgIMKgIHByaW50ZigmcXVvdDtkaXNhYmxpbmcgbG9vcGJhY2sgZmFpbGVkOiVtXG4mcXVv
dDspOzxicj48L2gzPjwvZGl2PjxkaXY+wqDCoDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkN5cmlsIEhydWJp
cyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocnViaXNAc3VzZS5jeiI+Y2hydWJpc0BzdXNlLmN6PC9h
PiZndDsg5LqOMjAyMOW5tDPmnIgyN+aXpeWRqOS6lCDkuIvljYg5OjQ35YaZ6YGT77yaPGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij5TaWduZWQtb2ZmLWJ5OiBDeXJpbCBIcnViaXMgJmx0OzxhIGhyZWY9Im1haWx0
bzpjaHJ1YmlzQHN1c2UuY3oiIHRhcmdldD0iX2JsYW5rIj5jaHJ1YmlzQHN1c2UuY3o8L2E+Jmd0
Ozxicj4NCi0tLTxicj4NCsKgcnVudGVzdC9rZXJuZWxfbWlzY8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgNSArPGJyPg0KwqAuLi4va2VybmVsL2RldmljZS1k
cml2ZXJzL3VhcnQvLmdpdGlnbm9yZcKgIMKgIMKgfMKgIMKgMSArPGJyPg0KwqB0ZXN0Y2FzZXMv
a2VybmVsL2RldmljZS1kcml2ZXJzL3VhcnQvTWFrZWZpbGUgfMKgIMKgNCArPGJyPg0KwqB0ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3VhcnQvdWFydDAxLmMgfCA1MjIgKysrKysrKysr
KysrKysrKysrPGJyPg0KwqA0IGZpbGVzIGNoYW5nZWQsIDUzMiBpbnNlcnRpb25zKCspPGJyPg0K
wqBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy91YXJ0
Ly5naXRpZ25vcmU8YnI+DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL2Rl
dmljZS1kcml2ZXJzL3VhcnQvTWFrZWZpbGU8YnI+DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3VhcnQvdWFydDAxLmM8YnI+DQo8YnI+DQpkaWZm
IC0tZ2l0IGEvcnVudGVzdC9rZXJuZWxfbWlzYyBiL3J1bnRlc3Qva2VybmVsX21pc2M8YnI+DQpp
bmRleCA3OTM3YzdiYmYuLmE3ZjFkOWI1NiAxMDA2NDQ8YnI+DQotLS0gYS9ydW50ZXN0L2tlcm5l
bF9taXNjPGJyPg0KKysrIGIvcnVudGVzdC9rZXJuZWxfbWlzYzxicj4NCkBAIC0xMywzICsxMyw4
IEBAIHpyYW0wMSB6cmFtMDEuc2g8YnI+DQrCoHpyYW0wMiB6cmFtMDIuc2g8YnI+DQrCoHpyYW0w
MyB6cmFtMDM8YnI+DQrCoHVtaXBfYmFzaWNfdGVzdCB1bWlwX2Jhc2ljX3Rlc3Q8YnI+DQordWFy
dDAxXzk2MDAgdWFydDAxIC1iIDk2MDA8YnI+DQordWFydDAxXzE5MjAwIHVhcnQwMSAtYiAxOTIw
MDxicj4NCit1YXJ0MDFfMzg0MDAgdWFydDAxIC1iIDM4NDAwPGJyPg0KK3VhcnQwMV81NzYwMCB1
YXJ0MDEgLWIgNTc2MDA8YnI+DQordWFydDAxXzExNTIwMCB1YXJ0MDEgLWIgMTE1MjAwPGJyPg0K
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvdWFydC8uZ2l0aWdu
b3JlIGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy91YXJ0Ly5naXRpZ25vcmU8YnI+
DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAwMC4uOTMzM2U4ZGI5PGJy
Pg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZl
cnMvdWFydC8uZ2l0aWdub3JlPGJyPg0KQEAgLTAsMCArMSBAQDxicj4NCit1YXJ0MDE8YnI+DQpk
aWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy91YXJ0L01ha2VmaWxl
IGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy91YXJ0L01ha2VmaWxlPGJyPg0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwMDAuLjFjOTBlNWNkNjxicj4NCi0t
LSAvZGV2L251bGw8YnI+DQorKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3Vh
cnQvTWFrZWZpbGU8YnI+DQpAQCAtMCwwICsxLDQgQEA8YnI+DQorPGJyPg0KK3RvcF9zcmNkaXLC
oCDCoCDCoD89IC4uLy4uLy4uLy4uPGJyPg0KK2luY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRl
L21rLzxhIGhyZWY9Imh0dHA6Ly90ZXN0Y2FzZXMubWsiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPnRlc3RjYXNlcy5tazwvYT48YnI+DQoraW5jbHVkZSAkKHRvcF9zcmNkaXIpL2lu
Y2x1ZGUvbWsvPGEgaHJlZj0iaHR0cDovL2dlbmVyaWNfbGVhZl90YXJnZXQubWsiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmdlbmVyaWNfbGVhZl90YXJnZXQubWs8L2E+PGJyPg0K
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvdWFydC91YXJ0MDEu
YyBiL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvdWFydC91YXJ0MDEuYzxicj4NCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggMDAwMDAwMDAwLi40NjQ3YzU1ZTM8YnI+DQot
LS0gL2Rldi9udWxsPGJyPg0KKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy91
YXJ0L3VhcnQwMS5jPGJyPg0KQEAgLTAsMCArMSw1MjIgQEA8YnI+DQorLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seTxicj4NCis8YnI+DQorLyo8YnI+DQorwqAgwqBDb3B5
cmlnaHQgKGMpIDIwMTQgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmJpZ2Vhc3lAbGludXRyb25peC5kZSIgdGFyZ2V0PSJfYmxhbmsiPmJpZ2Vhc3lAbGludXRy
b25peC5kZTwvYT4mZ3Q7PGJyPg0KK8KgIMKgQ29weXJpZ2h0IChjKSAyMDIwIEN5cmlsIEhydWJp
cyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmNocnViaXNAc3VzZS5jeiIgdGFyZ2V0PSJfYmxhbmsiPmNo
cnViaXNAc3VzZS5jejwvYT4mZ3Q7PGJyPg0KKzxicj4NCisgKi88YnI+DQorPGJyPg0KKyNpbmNs
dWRlICZsdDtzdGRpby5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7Y3R5cGUuaCZndDs8YnI+DQor
I2luY2x1ZGUgJmx0O3N0cmluZy5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7c3RkbGliLmgmZ3Q7
PGJyPg0KKyNpbmNsdWRlICZsdDtzeXMvc3RhdC5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7ZmNu
dGwuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O3Rlcm1pb3MuaCZndDs8YnI+DQorI2luY2x1ZGUg
Jmx0O3N0ZGFyZy5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7dW5pc3RkLmgmZ3Q7PGJyPg0KKyNp
bmNsdWRlICZsdDtzeXMvbW1hbi5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7c3RkaW50LmgmZ3Q7
PGJyPg0KKyNpbmNsdWRlICZsdDtwb2xsLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtzeXMvaW9j
dGwuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2xpbnV4L3NlcmlhbC5oJmd0Ozxicj4NCis8YnI+
DQorI2luY2x1ZGUgJnF1b3Q7dHN0X3Rlc3QuaCZxdW90Ozxicj4NCis8YnI+DQorc3RhdGljIGNv
bnN0IGNoYXIgaGV4X2FzY1tdID0gJnF1b3Q7MDEyMzQ1Njc4OWFiY2RlZiZxdW90Ozs8YnI+DQor
I2RlZmluZSBoZXhfYXNjX2xvKHgpwqAgaGV4X2FzY1soKHgpICZhbXA7IDB4MGYpXTxicj4NCisj
ZGVmaW5lIGhleF9hc2NfaGkoeCnCoCBoZXhfYXNjWygoeCkgJmFtcDsgMHhmMCkgJmd0OyZndDsg
NF08YnI+DQorPGJyPg0KK3N0cnVjdCBnX29wdCB7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciAqdWFy
dF9kZXY7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciAqZmlsZV90cmFuczs8YnI+DQorwqAgwqAgwqAg
wqBpbnQgYmF1ZF9yYXRlOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBsb29wczs8YnI+
DQorwqAgwqAgwqAgwqB1bnNpZ25lZCBjaGFyIGh3Zmxvdzs8YnI+DQorwqAgwqAgwqAgwqB1bnNp
Z25lZCBjaGFyIGRvX3Rlcm1pb3M7PGJyPg0KKyNkZWZpbmUgTU9ERV9UWF9PTkxZwqAgwqAgKDEg
Jmx0OyZsdDsgMCk8YnI+DQorI2RlZmluZSBNT0RFX1JYX09OTFnCoCDCoCAoMSAmbHQ7Jmx0OyAx
KTxicj4NCisjZGVmaW5lIE1PREVfRFVQTEVYwqAgwqAgwqAoTU9ERV9UWF9PTkxZIHwgTU9ERV9S
WF9PTkxZKTxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBtb2RlOzxicj4NCivCoCDCoCDC
oCDCoHVuc2lnbmVkIGNoYXIgKmNtcF9idWZmOzxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGlj
IGludCB2c2NucHJpbnRmKGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUsIGNvbnN0IGNoYXIgKmZtdCwg
dmFfbGlzdCBhcmdzKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGk7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGkgPSB2c25wcmludGYoYnVmLCBzaXplLCBmbXQsIGFyZ3MpOzxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBpZiAoaSAmbHQ7IChpbnQpc2l6ZSk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gaTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoc2l6ZSAhPSAwKTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBzaXplIC0gMTs8YnI+DQorwqAgwqAgwqAg
wqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIGludCBzY25wcmludGYoY2hh
ciAqYnVmLCBzaXplX3Qgc2l6ZSwgY29uc3QgY2hhciAqZm10LCAuLi4pPGJyPg0KK3s8YnI+DQor
wqAgwqAgwqAgwqB2YV9saXN0IGFyZ3M7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGk7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoHZhX3N0YXJ0KGFyZ3MsIGZtdCk7PGJyPg0KK8KgIMKgIMKgIMKgaSA9
IHZzY25wcmludGYoYnVmLCBzaXplLCBmbXQsIGFyZ3MpOzxicj4NCivCoCDCoCDCoCDCoHZhX2Vu
ZChhcmdzKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIGk7PGJyPg0KK308YnI+DQor
PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZCBoZXhfZHVtcF90b19idWZmZXIoY29uc3Qgdm9pZCAq
YnVmLCBpbnQgbGVuLCBpbnQgcm93c2l6ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
bnQgZ3JvdXBzaXplLCBjaGFyICpsaW5lYnVmLCBpbnQgbGluZWJ1ZmxlbiwgaW50IGFzY2lpKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgY29uc3QgdWludDhfdCAqcHRyID0gYnVmOzxicj4NCivC
oCDCoCDCoCDCoHVpbnQ4X3QgY2g7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGosIGx4ID0gMDs8YnI+
DQorwqAgwqAgwqAgwqBpbnQgYXNjaWlfY29sdW1uOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBp
ZiAocm93c2l6ZSAhPSAxNiAmYW1wOyZhbXA7IHJvd3NpemUgIT0gMzIpPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcm93c2l6ZSA9IDE2Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAo
IWxlbik8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIG5pbDs8YnI+DQorwqAgwqAg
wqAgwqBpZiAobGVuICZndDsgcm93c2l6ZSnCoCDCoCDCoCAvKiBsaW1pdCB0byBvbmUgbGluZSBh
dCBhIHRpbWUgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsZW4gPSByb3dzaXplOzxi
cj4NCivCoCDCoCDCoCDCoGlmICgobGVuICUgZ3JvdXBzaXplKSAhPSAwKcKgIMKgIMKgLyogbm8g
bWl4ZWQgc2l6ZSBvdXRwdXQgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncm91cHNp
emUgPSAxOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzd2l0Y2ggKGdyb3Vwc2l6ZSkgezxicj4N
CivCoCDCoCDCoCDCoGNhc2UgODogezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnN0
IHVpbnQ2NF90ICpwdHI4ID0gYnVmOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBu
Z3JvdXBzID0gbGVuIC8gZ3JvdXBzaXplOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBmb3IgKGogPSAwOyBqICZsdDsgbmdyb3VwczsgaisrKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGx4ICs9IHNjbnByaW50ZihsaW5lYnVmICsgbHgsIGxpbmVi
dWZsZW4gLSBseCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDslcyUxNi4xNmxseCZxdW90OywgaiA/ICZxdW90OyAm
cXVvdDsgOiAmcXVvdDsmcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKHVuc2lnbmVkIGxvbmcgbG9uZykqKHB0cjgg
KyBqKSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXNjaWlfY29sdW1uID0gMTcgKiBu
Z3JvdXBzICsgMjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNhc2UgNDogezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnN0IHVpbnQzMl90ICpwdHI0ID0gYnVmOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBuZ3JvdXBzID0gbGVuIC8gZ3JvdXBzaXpl
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmb3IgKGogPSAwOyBqICZsdDsg
bmdyb3VwczsgaisrKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGx4
ICs9IHNjbnByaW50ZihsaW5lYnVmICsgbHgsIGxpbmVidWZsZW4gLSBseCw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDslcyU4Ljh4JnF1b3Q7LCBqID8gJnF1b3Q7ICZxdW90OyA6ICZxdW90OyZxdW90OywgKihwdHI0
ICsgaikpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFzY2lpX2NvbHVtbiA9IDkgKiBu
Z3JvdXBzICsgMjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNhc2UgMjogezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnN0IHVpbnQxNl90ICpwdHIyID0gYnVmOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBuZ3JvdXBzID0gbGVuIC8gZ3JvdXBzaXpl
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmb3IgKGogPSAwOyBqICZsdDsg
bmdyb3VwczsgaisrKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGx4
ICs9IHNjbnByaW50ZihsaW5lYnVmICsgbHgsIGxpbmVidWZsZW4gLSBseCw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDslcyU0LjR4JnF1b3Q7LCBqID8gJnF1b3Q7ICZxdW90OyA6ICZxdW90OyZxdW90OywgKihwdHIy
ICsgaikpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFzY2lpX2NvbHVtbiA9IDUgKiBu
Z3JvdXBzICsgMjs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGRlZmF1bHQ6PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZm9yIChqID0gMDsgKGogJmx0OyBsZW4pICZhbXA7
JmFtcDsgKGx4ICsgMykgJmx0Oz0gbGluZWJ1ZmxlbjsgaisrKSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ggPSBwdHJbal07PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbGluZWJ1ZltseCsrXSA9IGhleF9hc2NfaGkoY2gpOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxpbmVidWZbbHgrK10gPSBoZXhf
YXNjX2xvKGNoKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW5l
YnVmW2x4KytdID0gJiMzOTsgJiMzOTs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKGogPT0gNyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBsaW5lYnVmW2x4KytdID0gJiMzOTsgJiMzOTs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChqKTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGx4LS07PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFzY2lpX2NvbHVtbiA9IDMgKiByb3dzaXplICsgMiAr
IDI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKg
fTxicj4NCivCoCDCoCDCoCDCoGlmICghYXNjaWkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ290byBuaWw7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHdoaWxlIChseCAmbHQ7IChsaW5l
YnVmbGVuIC0gMSkgJmFtcDsmYW1wOyBseCAmbHQ7IChhc2NpaV9jb2x1bW4gLSAxKSk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW5lYnVmW2x4KytdID0gJiMzOTsgJiMzOTs7PGJyPg0K
K8KgIMKgIMKgIMKgZm9yIChqID0gMDsgKGogJmx0OyBsZW4pICZhbXA7JmFtcDsgKGx4ICsgMikg
Jmx0OyBsaW5lYnVmbGVuOyBqKyspIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjaCA9
IHB0cltqXTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW5lYnVmW2x4KytdID0gKGlz
YXNjaWkoY2gpICZhbXA7JmFtcDsgaXNwcmludChjaCkpID8gY2ggOiAmIzM5Oy4mIzM5Ozs8YnI+
DQorwqAgwqAgwqAgwqB9PGJyPg0KK25pbDo8YnI+DQorwqAgwqAgwqAgwqBsaW5lYnVmW2x4Kytd
ID0gJiMzOTtcMCYjMzk7Ozxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZCBwcmludF9o
ZXhfZHVtcChjb25zdCB2b2lkICpidWYsIGludCBsZW4sIGludCBvZmZzZXQpPGJyPg0KK3s8YnI+
DQorwqAgwqAgwqAgwqBjb25zdCB1aW50OF90ICpwdHIgPSBidWY7PGJyPg0KK8KgIMKgIMKgIMKg
aW50IGksIGxpbmVsZW4sIHJlbWFpbmluZyA9IGxlbjs8YnI+DQorwqAgwqAgwqAgwqBjaGFyIGxp
bmVidWZbMzIgKiAzICsgMiArIDMyICsgMiArIDFdOzxicj4NCivCoCDCoCDCoCDCoGludCByb3dz
aXplID0gMTY7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGdyb3Vwc2l6ZSA9IDE7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmIChyb3dzaXplICE9IDE2ICZhbXA7JmFtcDsgcm93c2l6ZSAhPSAzMik8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByb3dzaXplID0gMTY7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0OyBsZW47IGkgKz0gcm93c2l6ZSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxpbmVsZW4gPSBNSU4ocmVtYWluaW5nLCByb3dzaXplKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZW1haW5pbmcgLT0gcm93c2l6ZTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaGV4X2R1bXBfdG9fYnVmZmVyKHB0ciArIGks
IGxpbmVsZW4sIHJvd3NpemUsIGdyb3Vwc2l6ZSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW5lYnVmLCBzaXplb2YobGluZWJ1ZiksIDEpOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7JS44eDogJXNc
biZxdW90OywgaSArIG9mZnNldCwgbGluZWJ1Zik7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCit9
PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IHN0cmVzc190ZXN0X3VhcnRfb25jZShzdHJ1Y3QgZ19v
cHQgKm9wdHMsIGludCBmZCwgdW5zaWduZWQgY2hhciAqZGF0YSw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBvZmZfdCBkYXRhX2xlbik8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHVuc2ln
bmVkIGNoYXIgKmNtcF9kYXRhID0gb3B0cy0mZ3Q7Y21wX2J1ZmY7PGJyPg0KK8KgIMKgIMKgIMKg
c3NpemVfdCBzaXplOzxicj4NCivCoCDCoCDCoCDCoGludCB3YWl0X3J4Ozxicj4NCivCoCDCoCDC
oCDCoGludCB3YWl0X3R4Ozxicj4NCivCoCDCoCDCoCDCoHNzaXplX3QgcHJvZ3Jlc3NfcnggPSAw
Ozxicj4NCivCoCDCoCDCoCDCoHNzaXplX3QgcHJvZ3Jlc3NfdHggPSAwOzxicj4NCivCoCDCoCDC
oCDCoHVuc2lnbmVkIGludCByZWFkcyA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgdW5zaWduZWQgaW50
IHdyaXRlcyA9IDA7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGRvIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdHJ1Y3QgcG9sbGZkIHBmZCA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAuZmQgPSBmZCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCByZXQ7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChvcHRzLSZndDttb2RlICZhbXA7IE1PREVfUlhfT05M
WSAmYW1wOyZhbXA7IHByb2dyZXNzX3J4ICZsdDsgZGF0YV9sZW4pIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwZmQuZXZlbnRzIHw9IFBPTExJTjs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0X3J4ID0gMTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9IGVsc2Ugezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHdhaXRfcnggPSAwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG9wdHMtJmd0O21vZGUgJmFtcDsg
TU9ERV9UWF9PTkxZICZhbXA7JmFtcDsgcHJvZ3Jlc3NfdHggJmx0OyBkYXRhX2xlbikgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBmZC5ldmVudHMgfD0gUE9MTE9V
VDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0X3R4ID0gMTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9IGVsc2Ugezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdhaXRfdHggPSAwOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gcG9sbCgm
YW1wO3BmZCwgMSwgMTAgKiAxMDAwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
cmV0ID09IDApIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3Rf
cmVzKFRGQUlMLCAmcXVvdDt0aW1lb3V0LCBSWC9UWDogJXpkLyV6ZFxuJnF1b3Q7LCBwcm9ncmVz
c19yeCwgcHJvZ3Jlc3NfdHgpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAocmV0ICZsdDsgMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHRzdF9yZXMoVEZBSUwgfCBURVJSTk8sICZxdW90O3BvbGwoKSBmYWls
ZWQmcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVy
biAxOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaWYgKHBmZC5yZXZlbnRzICZhbXA7IFBPTExJTikgezxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemUgPSByZWFkKGZkLCBjbXBfZGF0YSAr
IHByb2dyZXNzX3J4LCBkYXRhX2xlbiAtIHByb2dyZXNzX3J4KTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoc2l6ZSAmbHQ7IDApIHs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfcmVzKFRGQUlMIHwgVEVS
Uk5PLCAmcXVvdDtyZWFkKCkgZmFpbGVkJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gMTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVhZHMrKzs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBwcm9ncmVzc19yeCArPSBzaXplOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGlmIChwcm9ncmVzc19yeCAmZ3Q7PSBkYXRhX2xlbik8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0X3J4ID0gMDs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChwZmQucmV2ZW50cyAmYW1wOyBQT0xMT1VUKSB7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemUgPSB3cml0ZShmZCwgZGF0YSArIHByb2dyZXNz
X3R4LCBkYXRhX2xlbiAtIHByb2dyZXNzX3R4KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAoc2l6ZSAmbHQ7IDApIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfcmVzKFRGQUlMIHwgVEVSUk5PLCAmcXVv
dDt3cml0ZSgpIGZhaWxlZCZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIDE7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHdyaXRlcysrOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByb2dy
ZXNzX3R4ICs9IHNpemU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aWYgKHByb2dyZXNzX3R4ICZndDs9IGRhdGFfbGVuKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdhaXRfdHggPSAwOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9IHdoaWxlICh3YWl0X3J4IHx8IHdhaXRf
dHgpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAmcXVvdDtOZWVkZWQg
JXUgcmVhZHMgJXUgd3JpdGVzICZxdW90OywgcmVhZHMsIHdyaXRlcyk7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoGlmIChvcHRzLSZndDttb2RlICZhbXA7IE1PREVfUlhfT05MWSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBpOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludCBmb3VuZCA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5z
aWduZWQgaW50IG1pbl9wb3M7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5zaWduZWQg
aW50IG1heF9wb3M7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghbWVt
Y21wKGRhdGEsIGNtcF9kYXRhLCBkYXRhX2xlbikpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0c3RfcmVzKFRQQVNTLCAmcXVvdDtSWCBwYXNzZWQmcXVvdDspOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZm9yIChpID0gMDsgaSAmbHQ7IGRhdGFfbGVuICZhbXA7JmFtcDsgIWZvdW5kOyBpKyspIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoZGF0YVtpXSAhPSBj
bXBfZGF0YVtpXSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGZvdW5kID0gMTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIWZvdW5kKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdHN0X3JlcyhURkFJTCwgJnF1b3Q7bWVtY21wKCkgZGlkbiYjMzk7
dCBtYXRjaCBidXQgbWFudWFsIGNtcCBkaWQmcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAxOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWF4X3BvcyA9IChpICZhbXA7
IH4weGZVTEwpICsgMTYgKiAzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChtYXhf
cG9zICZndDsgZGF0YV9sZW4pPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbWF4X3BvcyA9IGRhdGFfbGVuOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBtaW5fcG9zID0gaSAmYW1wOyB+MHhmVUxMOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChtaW5fcG9zICZndDsgMTYgKiAzKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoG1pbl9wb3MgLT0gMTYgKiAzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGVsc2U8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtaW5fcG9zID0g
MDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X3JlcyhURkFJTCwgJnF1
b3Q7T2ggb2gsIGluY29uc2lzdGVuY3kgYXQgcG9zICVkICgweCV4KSZxdW90OywgaSwgaSk7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByaW50ZigmcXVvdDtcbk9yaWdpbmFs
IHNhbXBsZTpcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRfaGV4
X2R1bXAoZGF0YSArIG1pbl9wb3MsIG1heF9wb3MgLSBtaW5fcG9zLCBtaW5fcG9zKTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmKCZxdW90O1xuUmVjZWl2ZWQgc2Ft
cGxlOlxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludF9oZXhfZHVt
cChjbXBfZGF0YSArIG1pbl9wb3MsIG1heF9wb3MgLSBtaW5fcG9zLCBtaW5fcG9zKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gMTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGlmIChvcHRzLSZndDttb2RlICZhbXA7IE1PREVfVFhfT05MWSk8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfcmVzKFRQQVNTLCAmcXVvdDtUWCBwYXNz
ZWQmcXVvdDspOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4N
Cis8YnI+DQorc3RhdGljIGludCBzdHJlc3NfdGVzdF91YXJ0KHN0cnVjdCBnX29wdCAqb3B0cywg
aW50IGZkLCB1bnNpZ25lZCBjaGFyICpkYXRhLCBvZmZfdCBkYXRhX2xlbik8YnI+DQorezxicj4N
CivCoCDCoCDCoCDCoHVuc2lnbmVkIGludCBsb29wcyA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgaW50
IHN0YXR1czs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgb3B0cy0mZ3Q7Y21wX2J1ZmYgPSBTQUZF
X01BTExPQyhkYXRhX2xlbik7PGJyPg0KK8KgIMKgIMKgIMKgbWVtc2V0KG9wdHMtJmd0O2NtcF9i
dWZmLCAwLCBkYXRhX2xlbik7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGRvIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSBzdHJlc3NfdGVzdF91YXJ0X29uY2Uob3B0cywg
ZmQsIGRhdGEsIGRhdGFfbGVuKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtZW1zZXQo
b3B0cy0mZ3Q7Y21wX2J1ZmYsIDAsIGRhdGFfbGVuKTs8YnI+DQorwqAgwqAgwqAgwqB9IHdoaWxl
ICgrK2xvb3BzICZsdDsgb3B0cy0mZ3Q7bG9vcHMgJmFtcDsmYW1wOyAhc3RhdHVzKTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgZnJlZShvcHRzLSZndDtjbXBfYnVmZik7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoHJldHVybiBzdGF0dXM7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBpbnQg
c2V0dXBfdWFydChzdHJ1Y3QgZ19vcHQgKm9wdHMsIGludCBvcGVuX21vZGUsIHN0cnVjdCB0ZXJt
aW9zICpvbGRfdGVybSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCB0ZXJtaW9zIG5l
d190ZXJtOzxicj4NCivCoCDCoCDCoCDCoGludCBmZDs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB0c3RfcmVzKFRJTkZPLCAmcXVvdDtTZXR0aW5nIHVw
ICVzIHNwZWVkICV1IGh3Zmxvdz0ldSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBvcHRzLSZndDt1YXJ0X2Rldiwgb3B0cy0mZ3Q7YmF1ZF9yYXRlLCBvcHRzLSZndDtod2Zsb3cp
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBmZCA9IFNBRkVfT1BFTihvcHRzLSZndDt1YXJ0X2Rl
diwgb3Blbl9tb2RlIHwgT19OT05CTE9DSyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldCA9
IHRjZ2V0YXR0cihmZCwgb2xkX3Rlcm0pOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQgJmx0OyAw
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmsoVEJST0ssICZxdW90O3RjZ2V0
YXR0cigpIGZhaWxlZDogJW1cbiZxdW90Oyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoG5ld190
ZXJtID0gKm9sZF90ZXJtOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBvciBjX2NmbGFnIHw9
IEJPVEhFUiBhbmQgY19vc3BlZWQgZm9yIGFueSBzcGVlZCAqLzxicj4NCivCoCDCoCDCoCDCoHJl
dCA9IGNmc2V0c3BlZWQoJmFtcDtuZXdfdGVybSwgb3B0cy0mZ3Q7YmF1ZF9yYXRlKTs8YnI+DQor
wqAgwqAgwqAgwqBpZiAocmV0ICZsdDsgMCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0
c3RfYnJrKFRCUk9LLCAmcXVvdDtjZnNldHNwZWVkKCwgJXUpIGZhaWxlZCAlbVxuJnF1b3Q7LCBv
cHRzLSZndDtiYXVkX3JhdGUpOzxicj4NCivCoCDCoCDCoCDCoGNmbWFrZXJhdygmYW1wO25ld190
ZXJtKTs8YnI+DQorwqAgwqAgwqAgwqBuZXdfdGVybS5jX2NmbGFnIHw9IENSRUFEOzxicj4NCivC
oCDCoCDCoCDCoGlmIChvcHRzLSZndDtod2Zsb3cpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbmV3X3Rlcm0uY19jZmxhZyB8PSBDUlRTQ1RTOzxicj4NCivCoCDCoCDCoCDCoGVsc2U8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuZXdfdGVybS5jX2NmbGFnICZhbXA7PSB+Q1JUU0NU
Uzs8YnI+DQorwqAgwqAgwqAgwqBuZXdfdGVybS5jX2NjW1ZNSU5dID0gNjQ7PGJyPg0KK8KgIMKg
IMKgIMKgbmV3X3Rlcm0uY19jY1tWVElNRV0gPSA4Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBy
ZXQgPSB0Y3NldGF0dHIoZmQsIFRDU0FOT1csICZhbXA7bmV3X3Rlcm0pOzxicj4NCivCoCDCoCDC
oCDCoGlmIChyZXQgJmx0OyAwKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzdF9icmso
VEJST0ssICZxdW90O3Rjc2V0YXR0ciBmYWlsZWQ6ICVtXG4mcXVvdDspOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBpZiAob3B0cy0mZ3Q7ZG9fdGVybWlvcykgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJldCA9IHRjZmx1c2goZmQsIFRDSUZMVVNIKTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAocmV0ICZsdDsgMCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB0c3RfYnJrKFRCUk9LLCAmcXVvdDt0Y2ZsdXNoIGZhaWxlZDogJW1cbiZxdW90
Oyk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXQgPSBmY250
bChmZCwgRl9TRVRGTCwgMCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJldCk8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwcmludGYoJnF1b3Q7RmFpbGVkIHRvIHJlbW92ZSBub25ibG9jayBt
b2RlXG4mcXVvdDspOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gZmQ7PGJyPg0KK308
YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkIHJlc3RvcmVfdWFydChpbnQgZmQsIHN0cnVjdCB0ZXJt
aW9zICpvbGRfdGVybSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoGludCByZXQgPSB0Y3NldGF0
dHIoZmQsIFRDU0FGTFVTSCwgb2xkX3Rlcm0pOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZXQpPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmKCZxdW90O3Rjc2V0YXR0cigpIG9mIG9s
ZCBvbmVzIGZhaWxlZDogJW1cbiZxdW90Oyk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2
b2lkIHByaW50X2NvdW50ZXJzKGNvbnN0IGNoYXIgKnByZWZpeCw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1Y3Qgc2VyaWFsX2ljb3VudGVyX3N0cnVj
dCAqb2xkLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
cnVjdCBzZXJpYWxfaWNvdW50ZXJfc3RydWN0ICpuZXcpPGJyPg0KK3s8YnI+DQorI2RlZmluZSBD
TlQoeCkgKG5ldy0mZ3Q7eCAtIG9sZC0mZ3Q7eCk8YnI+DQorwqAgwqAgwqAgwqBwcmludGYoJnF1
b3Q7JXNjdHM6ICVkIGRzcjogJWQgcm5nOiAlZCBkY2Q6ICVkIHJ4OiAlZCB0eDogJWQgJnF1b3Q7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7ZnJhbWUgJWQgb3ZyICVkIHBhcjog
JWQgYnJrOiAlZCBidWZfb3ZycjogJWRcbiZxdW90OywgcHJlZml4LDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoENOVChjdHMpLCBDTlQoZHNyKSwgQ05UKHJuZyksIENOVChkY2QpLCBDTlQo
cngpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoENOVCh0eCksIENOVChmcmFtZSksIENO
VChvdmVycnVuKSwgQ05UKHBhcml0eSksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQ05U
KGJyayksIENOVChidWZfb3ZlcnJ1bikpOzxicj4NCisjdW5kZWYgQ05UPGJyPg0KK308YnI+DQor
PGJyPg0KK3N0YXRpYyBzdHJ1Y3QgZ19vcHQgb3B0cyA9IHs8YnI+DQorwqAgwqAgwqAgwqAuYmF1
ZF9yYXRlID0gMTE1MjAwLDxicj4NCivCoCDCoCDCoCDCoC5sb29wcyA9IDEsPGJyPg0KK8KgIMKg
IMKgIMKgLmRvX3Rlcm1pb3MgPSAxLDxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIGNoYXIg
KnVhcnRfcng7PGJyPg0KK3N0YXRpYyBjaGFyICp1YXJ0X3R4Ozxicj4NCis8YnI+DQordW5zaWdu
ZWQgY2hhciAqZGF0YTs8YnI+DQorc3RhdGljIGxvbmcgZGF0YV9sZW47PGJyPg0KKzxicj4NCit2
b2lkIHJ1bih2b2lkKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHNlcmlhbF9pY291
bnRlcl9zdHJ1Y3Qgb2xkX2NvdW50ZXJzOzxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBzZXJpYWxf
aWNvdW50ZXJfc3RydWN0IG5ld19jb3VudGVyczs8YnI+DQorwqAgwqAgwqAgwqBpbnQgcmV0LCBm
ZF9yeCwgZmRfdHg7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHRlcm1pb3Mgb2xkX3Rlcm1fcngs
IG9sZF90ZXJtX3R4Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgZ19vcHQgb3B0c19p
biA9IG9wdHM7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGdfb3B0IG9wdHNfb3V0ID0gb3B0czs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgb3B0c19pbi51YXJ0X2RldiA9IHVhcnRfcng7PGJyPg0K
K8KgIMKgIMKgIMKgb3B0c19vdXQudWFydF9kZXYgPSB1YXJ0X3R4Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBvcHRzX2luLm1vZGUgPSBNT0RFX1JYX09OTFk7PGJyPg0KK8KgIMKgIMKgIMKgb3B0
c19vdXQubW9kZSA9IE1PREVfVFhfT05MWTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZmRfcngg
PSBzZXR1cF91YXJ0KCZhbXA7b3B0c19pbiwgT19SRE9OTFksICZhbXA7b2xkX3Rlcm1fcngpOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoIXN0cmNtcCh1YXJ0X3J4LCB1YXJ0X3R4KSk8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmZF90eCA9IFNBRkVfT1BFTih1YXJ0X3R4LCBPX1dS
T05MWSk7PGJyPg0KK8KgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGZkX3R4ID0gc2V0dXBfdWFydCgmYW1wO29wdHNfb3V0LCBPX1dST05MWSwgJmFtcDtvbGRfdGVy
bV90eCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmICghU0FGRV9GT1JLKCkpIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpb2N0bChmZF9yeCwgVElPQ0dJQ09VTlQsICZhbXA7b2xk
X2NvdW50ZXJzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJlc3NfdGVzdF91YXJ0
KCZhbXA7b3B0c19pbiwgZmRfcngsIGRhdGEsIGRhdGFfbGVuKTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXQgPSBpb2N0bChmZF9yeCwgVElPQ0dJQ09VTlQsICZhbXA7bmV3X2NvdW50
ZXJzKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0ICZndDsgMCk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcmludF9jb3VudGVycygmcXVvdDtS
WDomcXVvdDssICZhbXA7b2xkX2NvdW50ZXJzLCAmYW1wO25ld19jb3VudGVycyk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZXhpdCgwKTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGlmICghU0FGRV9GT1JLKCkpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpb2N0bChmZF90eCwgVElPQ0dJQ09VTlQsICZhbXA7b2xkX2NvdW50ZXJzKTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJlc3NfdGVzdF91YXJ0KCZhbXA7b3B0c19vdXQs
IGZkX3R4LCBkYXRhLCBkYXRhX2xlbik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
ID0gaW9jdGwoZmRfdHgsIFRJT0NHSUNPVU5ULCAmYW1wO25ld19jb3VudGVycyk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCAmZ3Q7IDApPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRfY291bnRlcnMoJnF1b3Q7VFg6JnF1b3Q7LCAmYW1w
O29sZF9jb3VudGVycywgJmFtcDtuZXdfY291bnRlcnMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGV4aXQoMCk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBTQUZFX1dBSVQoTlVMTCk7PGJyPg0KK8KgIMKgIMKgIMKgU0FGRV9XQUlUKE5VTEwpOzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqByZXN0b3JlX3VhcnQoZmRfcngsICZhbXA7b2xkX3Rlcm1fcngp
Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoc3RyY21wKHVhcnRfcngsIHVhcnRfdHgpKTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3RvcmVfdWFydChmZF90eCwgJmFtcDtvbGRf
dGVybV90eCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGNsb3NlKGZkX3J4KTs8YnI+DQorwqAg
wqAgwqAgwqBjbG9zZShmZF90eCk7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkIG1h
cF9maWxlKGNvbnN0IGNoYXIgKmZuYW1lKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0
IHN0YXQgc3Q7PGJyPg0KK8KgIMKgIMKgIMKgaW50IGZkOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBmZCA9IFNBRkVfT1BFTihmbmFtZSwgT19SRE9OTFkpOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBTQUZFX0ZTVEFUKGZkLCAmYW1wO3N0KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZGF0YV9s
ZW4gPSBzdC5zdF9zaXplOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBkYXRhID0gU0FGRV9NTUFQ
KE5VTEwsIGRhdGFfbGVuLCBQUk9UX1JFQUQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIE1BUF9TSEFSRUQgfCBNQVBfTE9DS0VEIHwgTUFQX1BPUFVMQVRFLCBmZCwg
MCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHRzdF9yZXMoVElORk8sICZxdW90O01hcHBlZCBm
aWxlICYjMzk7JXMmIzM5OyBzaXplICVsaSBieXRlcyZxdW90OywgZm5hbWUsIGRhdGFfbGVuKTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgU0FGRV9DTE9TRShmZCk7PGJyPg0KK308YnI+DQorPGJy
Pg0KK3N0YXRpYyB2b2lkIG1hcF9idWZmZXIobG9uZyBidWZfc2l6ZSk8YnI+DQorezxicj4NCivC
oCDCoCDCoCDCoHNpemVfdCBpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBkYXRhX2xlbiA9IGJ1
Zl9zaXplOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBkYXRhID0gU0FGRV9NTUFQKE5VTEwsIGRh
dGFfbGVuLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBNQVBfQU5PTllNT1VTIHwgTUFQX1NIQVJFRCB8IE1BUF9MT0NLRUQs
IC0xLCAwKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbG9uZyAqcCA9ICh2b2lkKilkYXRhOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBzcmFuZG9tKHRpbWUoTlVMTCkpOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgZGF0YV9sZW4gLyBzaXplb2YobG9uZyk7IGkr
Kyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwW2ldID0gcmFuZG9tKCk7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoHRzdF9yZXMoVElORk8sICZxdW90O01hcHBlZCBhbnlueW1vdXMgbWVt
b3J5IHNpemUgJWxpIGJ5dGVzJnF1b3Q7LCBkYXRhX2xlbik7PGJyPg0KK308YnI+DQorPGJyPg0K
K3N0YXRpYyBjaGFyICpiYXVkX3JhdGU7PGJyPg0KK3N0YXRpYyBjaGFyICpod2Zsb3c7PGJyPg0K
K3N0YXRpYyBjaGFyICpmbmFtZTs8YnI+DQorc3RhdGljIGNoYXIgKmJ1Zl9zaXplOzxicj4NCis8
YnI+DQorc3RhdGljIHZvaWQgc2V0dXAodm9pZCk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoGxv
bmcgc2l6ZSA9IDEwMjQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChiYXVkX3JhdGUpPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X3BhcnNlX2ludChiYXVkX3JhdGUsICZhbXA7
KG9wdHMuYmF1ZF9yYXRlKSwgMCwgSU5UX01BWCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlm
IChod2Zsb3cpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3B0cy5od2Zsb3cgPSAxOzxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoZm5hbWUgJmFtcDsmYW1wOyBidWZfc2l6ZSk8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfYnJrKFRCUk9LLCAmcXVvdDtPbmx5IG9uZSBv
ZiAtZiBhbmQgLXMgY291bGQgYmUgc2V0ISZxdW90Oyk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGlmIChidWZfc2l6ZSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfcGFyc2VfbG9u
ZyhidWZfc2l6ZSwgJmFtcDtzaXplLCAwLCBMT05HX01BWCk7PGJyPg0KKzxicj4NCivCoCDCoCDC
oCDCoHVhcnRfcnggPSBnZXRlbnYoJnF1b3Q7VUFSVF9SWCZxdW90Oyk7PGJyPg0KK8KgIMKgIMKg
IMKgdWFydF90eCA9IGdldGVudigmcXVvdDtVQVJUX1RYJnF1b3Q7KTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaWYgKGZuYW1lKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hcF9maWxl
KGZuYW1lKTs8YnI+DQorwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbWFwX2J1ZmZlcihzaXplKTs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCB0
c3RfdGVzdCB0ZXN0ID0gezxicj4NCivCoCDCoCDCoCDCoC5zZXR1cCA9IHNldHVwLDxicj4NCivC
oCDCoCDCoCDCoC50ZXN0X2FsbCA9IHJ1biw8YnI+DQorwqAgwqAgwqAgwqAub3B0aW9ucyA9IChz
dHJ1Y3QgdHN0X29wdGlvbltdKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeyZxdW90
O2I6JnF1b3Q7LCAmYW1wO2JhdWRfcmF0ZSwgJnF1b3Q7LWLCoCDCoCDCoCDCoEJhdWQgcmF0ZSAo
OTYwMCwgLi4uKSZxdW90O30sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeyZxdW90O3cm
cXVvdDsswqAgJmFtcDtod2Zsb3fCoCDCoCwgJnF1b3Q7LXfCoCDCoCDCoCDCoEVuYWJsZSBod2Zs
b3cgKFJUUy9DVFMpJnF1b3Q7fSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB7JnF1b3Q7
ZjomcXVvdDsswqAgJmFtcDtmbmFtZSzCoCDCoCAmcXVvdDstZsKgIMKgIMKgIMKgQmluYXJ5IGZp
bGUgZm9yIHRyYW5zZmVycyZxdW90O30sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgeyZx
dW90O3M6JnF1b3Q7LMKgICZhbXA7YnVmX3NpemUsICZxdW90Oy1zwqAgwqAgwqAgwqBCaW5hcnkg
YnVmZmVyIHNpemUmcXVvdDt9LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHt9PGJyPg0K
K8KgIMKgIMKgIMKgfSw8YnI+DQorwqAgwqAgwqAgwqAubmVlZHNfZGV2aWNlcyA9IChjb25zdCBj
aGFyICpjb25zdFtdKSB7JnF1b3Q7VUFSVF9SWCZxdW90OywgJnF1b3Q7VUFSVF9UWCZxdW90Oywg
TlVMTH0sPGJyPg0KK8KgIMKgIMKgIMKgLmZvcmtzX2NoaWxkID0gMSw8YnI+DQorfTs8YnI+DQot
LSA8YnI+DQoyLjI0LjE8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=
--000000000000293d7105a1e60079--

--===============0371215828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0371215828==--
