Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A02F109816
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 04:25:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28CFE3C220C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 04:25:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 549113C131B
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 04:25:08 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E236F140120E
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 04:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574738705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y/EjbqmqO4n7TOifEvxbmRLdkkjEEbSBgsXrcgQAF7Y=;
 b=SyQWGH9bKX6rTYvnqD7ROjz3PuWdbhCzIbP2afZYJP0F4ndZNhrhPZi+YmMcubY0FI45K4
 0ooEpQ8HsMPwGuOGOTGGTpws+sfSrb2qi5g3rOkGD/UX7TjjTaY+E1dGBh9Whfog5CXctO
 9KSOP8n4kOCYb67IlRd1QV4sHQ0OXrs=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-ZV8Hy8f6PDidIlGgjZGdbg-1; Mon, 25 Nov 2019 22:24:59 -0500
Received: by mail-oi1-f198.google.com with SMTP id q82so8677543oih.14
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 19:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lEZa1Dbe+FHTa+GKFS9vI4+fpXfgTKhLKQufL1iG9E4=;
 b=YOw9DmMnlCLqQEivPpoaHaWi1f36XKqI2m8wvgxowGAD5yvZ+7OkksSLeO7dxuu83X
 x6cetsrMUBcg6PZcpq4o2TSwXV455xsWTPH7BrPcsxRIv1jagQZ8mpazyKx3Bo6M5dwi
 dk7wc5UZkWXstWhwwhydUy99k/92GDW/PGLjjzUC2XDyeFZV/K+lJrDxsKDTJ/i3CpN4
 DE6yGFY/vbpHge9P9ZsfHmn+xWg8Zh8wlxtN18KBpFRIX14p9t3g+9co6Xde1ff8SyTG
 2hMgZbqdXPK2vJeLPMe06HXfibBkz8vhwYzOMN2dZSNqCTVEZbbhDaDvoRnHz201+Bo3
 emPA==
X-Gm-Message-State: APjAAAXbR0e+5aCegtVJ52NqZlEcVR5Rkmar3io94tLk+KEetq2YayTW
 as+rZqP6HzFSIsWdBnAszSBjkuxjgtxCBQJKFtiyizFche1JWwJ6Lc99sodOW1dbjjczyLFKzuW
 UB0EDRtlYVP3SDbr52LOK23wONYA=
X-Received: by 2002:a54:4f8e:: with SMTP id g14mr240695oiy.144.1574738699244; 
 Mon, 25 Nov 2019 19:24:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqs8xP/+8r9fsPpKGuu7AIvpkehrKXGmvDHGWKT4Q4CI/WFNAeC8UvsSLnQyMeMQqqqyppquqkIIRaKd7lh+4=
X-Received: by 2002:a54:4f8e:: with SMTP id g14mr240680oiy.144.1574738698835; 
 Mon, 25 Nov 2019 19:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20191120072311.32333-1-liwang@redhat.com>
 <20191125130155.GA8703@rei.lan>
In-Reply-To: <20191125130155.GA8703@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Nov 2019 11:24:47 +0800
Message-ID: <CAEemH2cxS1KR1eYeBregDPU7qFMPH-4UggvprPhv3rO+UineEA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: ZV8Hy8f6PDidIlGgjZGdbg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_fill_fs: enhance the filesystem filling
 routine
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0693884933=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0693884933==
Content-Type: multipart/alternative; boundary="000000000000c232640598376c98"

--000000000000c232640598376c98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 9:13 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
> > index 4003dce97..3015c066e 100644
> > --- a/lib/tst_fill_fs.c
> > +++ b/lib/tst_fill_fs.c
> > @@ -6,6 +6,7 @@
> >  #include <errno.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> > +#include <sys/statvfs.h>
> >
> >  #define TST_NO_DEFAULT_MAIN
> >  #include "tst_test.h"
> > @@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)
> >       size_t len;
> >       ssize_t ret;
> >       int fd;
> > +     struct statvfs fi;
> > +     statvfs(path, &fi);
> >
> >       for (;;) {
> >               len =3D random() % (1024 * 102400);
> > @@ -37,17 +40,20 @@ void tst_fill_fs(const char *path, int verbose)
> >                       return;
> >               }
> >
> > -             while (len) {
> > +             while (len >=3D fi.f_bsize/2) {
> >                       ret =3D write(fd, buf, MIN(len, sizeof(buf)));
> >
> >                       if (ret < 0) {
> > +                             if (errno =3D=3D ENOSPC) {
> > +                                     SAFE_FSYNC(fd);
> > +                                     len /=3D 2;
> > +                                     continue;
> > +                             }
> > +
> >                               SAFE_CLOSE(fd);
> >
> >                               if (errno !=3D ENOSPC)
> >                                       tst_brk(TBROK | TERRNO, "write()"=
);
> > -
> > -                             tst_res(TINFO | TERRNO, "write()");
> > -                             return;
> >                       }
> >
> >                       len -=3D ret;
>
> Wouldn't this cause second SAFE_CLOSE() here because we no longer do a
> return from from the while loop on ENOSPC?
>

No, it wouldn't cause that. The while's condition judgment will help to
go-out the loop when len < fi.f_bsize/2, and it only do SAFE_CLOSE() once
in any situation I think.


> Why not just:
>
> diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
> index 4003dce97..2226171d8 100644
> --- a/lib/tst_fill_fs.c
> +++ b/lib/tst_fill_fs.c
> @@ -41,6 +41,13 @@ void tst_fill_fs(const char *path, int verbose)
>                         ret =3D write(fd, buf, MIN(len, sizeof(buf)));
>
>                         if (ret < 0) {
> +                               /* retry on ENOSPC to make sure filesyste=
m
> is really full */
> +                               if (errno =3D=3D ENOSPC && len >=3D
> fi.f_bsize/2) {
> +                                       SAFE_FSYNC(fd);
> +                                       len /=3D 2;
> +                                       continue;
>

It does the same thing as my patch, but your code looks a little better
because it reserves the print&reutrn part in below.

I will send patch V3 on your suggestion.


> +                               }
> +
>                                 SAFE_CLOSE(fd);
>
>                                 if (errno !=3D ENOSPC)
>
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
>

--=20
Regards,
Li Wang

--000000000000c232640598376c98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgTm92
IDI1LCAyMDE5IGF0IDk6MTMgUE0gQ3lyaWwgSHJ1YmlzICZsdDs8YSBocmVmPSJtYWlsdG86Y2hy
dWJpc0BzdXNlLmN6IiB0YXJnZXQ9Il9ibGFuayI+Y2hydWJpc0BzdXNlLmN6PC9hPiZndDsgd3Jv
dGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij5IaSE8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9saWIvdHN0X2Zp
bGxfZnMuYyBiL2xpYi90c3RfZmlsbF9mcy5jPGJyPg0KJmd0OyBpbmRleCA0MDAzZGNlOTcuLjMw
MTVjMDY2ZSAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2xpYi90c3RfZmlsbF9mcy5jPGJyPg0KJmd0
OyArKysgYi9saWIvdHN0X2ZpbGxfZnMuYzxicj4NCiZndDsgQEAgLTYsNiArNiw3IEBAPGJyPg0K
Jmd0O8KgICNpbmNsdWRlICZsdDtlcnJuby5oJmd0Ozxicj4NCiZndDvCoCAjaW5jbHVkZSAmbHQ7
c3RkaW8uaCZndDs8YnI+DQomZ3Q7wqAgI2luY2x1ZGUgJmx0O3N0ZGxpYi5oJmd0Ozxicj4NCiZn
dDsgKyNpbmNsdWRlICZsdDtzeXMvc3RhdHZmcy5oJmd0Ozxicj4NCiZndDvCoCA8YnI+DQomZ3Q7
wqAgI2RlZmluZSBUU1RfTk9fREVGQVVMVF9NQUlOPGJyPg0KJmd0O8KgICNpbmNsdWRlICZxdW90
O3RzdF90ZXN0LmgmcXVvdDs8YnI+DQomZ3Q7IEBAIC0xOSw2ICsyMCw4IEBAIHZvaWQgdHN0X2Zp
bGxfZnMoY29uc3QgY2hhciAqcGF0aCwgaW50IHZlcmJvc2UpPGJyPg0KJmd0O8KgIMKgIMKgIMKg
c2l6ZV90IGxlbjs8YnI+DQomZ3Q7wqAgwqAgwqAgwqBzc2l6ZV90IHJldDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqBpbnQgZmQ7PGJyPg0KJmd0OyArwqAgwqAgwqBzdHJ1Y3Qgc3RhdHZmcyBmaTs8YnI+
DQomZ3Q7ICvCoCDCoCDCoHN0YXR2ZnMocGF0aCwgJmFtcDtmaSk7PGJyPg0KJmd0O8KgIDxicj4N
CiZndDvCoCDCoCDCoCDCoGZvciAoOzspIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBsZW4gPSByYW5kb20oKSAlICgxMDI0ICogMTAyNDAwKTs8YnI+DQomZ3Q7IEBAIC0zNywxNyAr
NDAsMjAgQEAgdm9pZCB0c3RfZmlsbF9mcyhjb25zdCBjaGFyICpwYXRoLCBpbnQgdmVyYm9zZSk8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm47PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCiZndDvCoCA8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoHdoaWxlIChsZW4pIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoHdoaWxlIChsZW4gJmd0Oz0gZmkuZl9ic2l6ZS8yKSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gd3JpdGUoZmQsIGJ1ZiwgTUlOKGxlbiwgc2l6
ZW9mKGJ1ZikpKTs8YnI+DQomZ3Q7wqAgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKHJldCAmbHQ7IDApIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChlcnJubyA9PSBFTk9TUEMpIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFNBRkVfRlNZTkMoZmQpOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGVuIC89IDI7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb250aW51
ZTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBTQUZFX0NMT1NFKGZkKTs8YnI+DQomZ3Q7wqAgPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGVycm5vICE9IEVO
T1NQQyk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAmcXVvdDt3cml0ZSgpJnF1
b3Q7KTs8YnI+DQomZ3Q7IC08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHRzdF9yZXMoVElORk8gfCBURVJSTk8sICZxdW90O3dyaXRlKCkmcXVv
dDspOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmV0dXJuOzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08
YnI+DQomZ3Q7wqAgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
bGVuIC09IHJldDs8YnI+DQo8YnI+DQpXb3VsZG4mIzM5O3QgdGhpcyBjYXVzZSBzZWNvbmQgU0FG
RV9DTE9TRSgpIGhlcmUgYmVjYXVzZSB3ZSBubyBsb25nZXIgZG8gYTxicj4NCnJldHVybiBmcm9t
IGZyb20gdGhlIHdoaWxlIGxvb3Agb24gRU5PU1BDPzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+
PC9kaXY+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNt
YWxsIj5ObywgaXQgd291bGRuJiMzOTt0IGNhdXNlIHRoYXQuIFRoZSB3aGlsZSYjMzk7cyBjb25k
aXRpb27CoGp1ZGdtZW50IHdpbGwgaGVscCB0byBnby1vdXQgdGhlIGxvb3Agd2hlbiBsZW4gJmx0
O8KgZmkuZl9ic2l6ZS8yLCBhbmQgaXQgb25seSBkbyBTQUZFX0NMT1NFKCkgb25jZSBpbiBhbnkg
c2l0dWF0aW9uIEkgdGhpbmsuPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRl
ci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJy
Pg0KV2h5IG5vdCBqdXN0Ojxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9saWIvdHN0X2ZpbGxfZnMu
YyBiL2xpYi90c3RfZmlsbF9mcy5jPGJyPg0KaW5kZXggNDAwM2RjZTk3Li4yMjI2MTcxZDggMTAw
NjQ0PGJyPg0KLS0tIGEvbGliL3RzdF9maWxsX2ZzLmM8YnI+DQorKysgYi9saWIvdHN0X2ZpbGxf
ZnMuYzxicj4NCkBAIC00MSw2ICs0MSwxMyBAQCB2b2lkIHRzdF9maWxsX2ZzKGNvbnN0IGNoYXIg
KnBhdGgsIGludCB2ZXJib3NlKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJldCA9IHdyaXRlKGZkLCBidWYsIE1JTihsZW4sIHNpemVvZihidWYpKSk7PGJyPg0KPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHJldCAmbHQ7IDApIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBy
ZXRyeSBvbiBFTk9TUEMgdG8gbWFrZSBzdXJlIGZpbGVzeXN0ZW0gaXMgcmVhbGx5IGZ1bGwgKi88
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
ZXJybm8gPT0gRU5PU1BDICZhbXA7JmFtcDsgbGVuICZndDs9IGZpLmZfYnNpemUvMikgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFNBRkVfRlNZTkMoZmQpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxlbiAvPSAyOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRpbnVlOzxi
cj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZh
dWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj5JdCBkb2VzIHRoZSBzYW1lIHRoaW5nIGFzIG15
IHBhdGNoLCBidXQgeW91ciBjb2RlIGxvb2tzIGEgbGl0dGxlIGJldHRlciBiZWNhdXNlIGl0IHJl
c2VydmVzIHRoZSBwcmludCZhbXA7cmV1dHJuwqBwYXJ0IGluIGJlbG93LjwvZGl2PjwvZGl2Pjxk
aXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPjxicj48L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj5JIHdp
bGwgc2VuZCBwYXRjaCBWMyBvbiB5b3VyIHN1Z2dlc3Rpb24uPC9kaXY+PGRpdj7CoDwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08
YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgU0FGRV9DTE9TRShmZCk7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGVycm5vICE9IEVOT1NQQyk8YnI+DQo8YnI+DQo8YnI+
DQotLSA8YnI+DQpDeXJpbCBIcnViaXM8YnI+DQo8YSBocmVmPSJtYWlsdG86Y2hydWJpc0BzdXNl
LmN6IiB0YXJnZXQ9Il9ibGFuayI+Y2hydWJpc0BzdXNlLmN6PC9hPjxicj4NCjxicj4NCjwvYmxv
Y2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYg
ZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPjxkaXY+UmVnYXJkcyw8YnI+PC9kaXY+PGRpdj5MaSBX
YW5nPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--000000000000c232640598376c98--


--===============0693884933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0693884933==--

