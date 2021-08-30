Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68F3FB378
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 11:55:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 147723C2BA4
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 11:55:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EFECA3C2AAC
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 11:55:21 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5750A1400BCB
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 11:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630317318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QMsyhTd+7/sEv3DRd6GYiup63+ntuX+FhPWoOL1Y/hs=;
 b=M6n75XQih+5SA3hrOYApHvKT6atY2stqqO5mO/noE9gRGu4PMemCLq8QNqrBUBwzzBgL17
 b2rgvHe5V/ruHvr96FIrvjCfDqW//jVfbPWFDsS4NY+qCcXxB0zfNooMeVG4hN8E2tOOfX
 Br7HfHKMZXJBIq2jLxfLOsiRcihVMPc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-21J-V1EPPgaehr54YbP0Jg-1; Mon, 30 Aug 2021 05:55:14 -0400
X-MC-Unique: 21J-V1EPPgaehr54YbP0Jg-1
Received: by mail-yb1-f197.google.com with SMTP id
 a62-20020a254d410000b0290592f360b0ccso2821922ybb.14
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 02:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMsyhTd+7/sEv3DRd6GYiup63+ntuX+FhPWoOL1Y/hs=;
 b=FrdEsL/XeEY1RA7E1hDksCob1oHuWWAg6duTy0WtHpJbN+eXLneMZHbq8WpOFQj/eU
 VC449q0grHwChyKgA9JOyWdVHDcpYyHKNQVpGGdFaw12IhaV2HpfnwMVGNW7oIgVngN/
 efX26w9M4KgLh0cueRnYkeHIEgCfahVjyDkcRO3jT7TItkpY3sFmdmA5360AejE3yz7D
 iO+WQDyoh1MO/+dr6i2xmOA6V1FaFHMpUG5TVzz04jjjdmPPHPLP0GWZlRAdFq55DnPV
 wwsS5/Il0UoHmvirvauDeZq8pJZHo3MxGDIQy6i9Hvmm5ChOiNfOCHuc4Bnf1ufzGE97
 3NAw==
X-Gm-Message-State: AOAM531/Dv2bOcZ19jXd5BYYxZ0t8qz2NwssPPpvPBhV0Wb8avHr9Dcb
 bc0ibi4wEZEbDxEPM3oK/nN5wNTlHClC1W34cDvO63+15N+mO8Q4Q5bbgJGpvWXyIeTgUgOXxTK
 CNdvxfrp65MaA143cgfw6eWAQaV8=
X-Received: by 2002:a25:1257:: with SMTP id 84mr23052296ybs.243.1630317313718; 
 Mon, 30 Aug 2021 02:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHIzBvGrTemfSpsmdolLa2hoTgSmU+3oJ8sPFIHA58D1TnmrvK4YMuxT4Qbb/2O3HNJJx2DGVdYS9zbK0S5vA=
X-Received: by 2002:a25:1257:: with SMTP id 84mr23052266ybs.243.1630317313400; 
 Mon, 30 Aug 2021 02:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210830070951.27803-1-zhanglianjie@uniontech.com>
In-Reply-To: <20210830070951.27803-1-zhanglianjie@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Aug 2021 17:55:00 +0800
Message-ID: <CAEemH2cJt3Ku90f2CUkypr-55H3dwEUpnO7-QcsyJbRRfVH2nw@mail.gmail.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_test_macros.h: Add TST_EXP_VAL macro
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
Content-Type: multipart/mixed; boundary="===============0847425270=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0847425270==
Content-Type: multipart/alternative; boundary="0000000000005634e405cac3d461"

--0000000000005634e405cac3d461
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 3:10 PM zhanglianjie <zhanglianjie@uniontech.com>
wrote:

> Add TST_EXP_VAL to determine whether the return value
> is equal to the given value.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>
 Reviewed-by: Li Wang <liwang@redhat.com>


>
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 50598aa15..0ccc01f49 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -132,6 +132,34 @@ extern void *TST_RET_PTR;
>                         TST_MSG_(TPASS, " passed", #SCALL,
> ##__VA_ARGS__);     \
>         } while (0)
>     \
>
> +
> +#define TST_EXP_VAL_SILENT_(SCALL, SSCALL, VAL, ...)
>      \
> +       do {
>      \
> +               TEST(SCALL);
>      \
> +
>     \
> +               TST_PASS = 0;
>     \
> +
>     \
> +               if (TST_RET != VAL) {
>     \
> +                       TST_MSGP_(TFAIL | TTERRNO, " retval not %ld",
>     \
> +                                 (long )VAL, SSCALL, ##__VA_ARGS__);
>     \
> +                       break;
>      \
> +               }
>     \
> +
>     \
> +               TST_PASS = 1;
>     \
> +
>     \
> +       } while (0)
> +
> +#define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL,
> #SCALL, VAL, ##__VA_ARGS__)
> +
> +#define TST_EXP_VAL(SCALL, VAL, ...)
>      \
> +       do {
>      \
> +               TST_EXP_VAL_SILENT(SCALL, VAL, ##__VA_ARGS__);
>      \
> +
>     \
> +               if (TST_PASS)
>     \
> +                       TST_MSG_(TPASS, " passed", #SCALL,
> ##__VA_ARGS__);     \
> +
>     \
> +       } while(0)
> +
>  #define TST_EXP_FAIL_(PASS_COND, SCALL, SSCALL, ERRNO, ...)
>       \
>         do {
>      \
>                 TEST(SCALL);
>      \
> --
> 2.20.1
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000005634e405cac3d461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIE1vbiwgQXVn
IDMwLCAyMDIxIGF0IDM6MTAgUE0gemhhbmdsaWFuamllICZsdDs8YSBocmVmPSJtYWlsdG86emhh
bmdsaWFuamllQHVuaW9udGVjaC5jb20iPnpoYW5nbGlhbmppZUB1bmlvbnRlY2guY29tPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5BZGQgVFNUX0VYUF9WQUwgdG8gZGV0ZXJtaW5lIHdo
ZXRoZXIgdGhlIHJldHVybiB2YWx1ZTxicj4NCmlzIGVxdWFsIHRvIHRoZSBnaXZlbiB2YWx1ZS48
YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiB6aGFuZ2xpYW5qaWUgJmx0OzxhIGhyZWY9Im1haWx0
bzp6aGFuZ2xpYW5qaWVAdW5pb250ZWNoLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnpoYW5nbGlhbmpp
ZUB1bmlvbnRlY2guY29tPC9hPiZndDs8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PHNwYW4gY2xhc3M9
ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPsKgUmV2aWV3ZWQtYnk6IExp
IFdhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzpsaXdhbmdAcmVkaGF0LmNvbSI+bGl3YW5nQHJlZGhh
dC5jb208L2E+Jmd0Ozwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbF9kZWZhdWx0
IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48L3NwYW4+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQo8YnI+DQpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS90c3RfdGVzdF9tYWNyb3MuaCBiL2luY2x1ZGUvdHN0X3Rlc3Rf
bWFjcm9zLmg8YnI+DQppbmRleCA1MDU5OGFhMTUuLjBjY2MwMWY0OSAxMDA2NDQ8YnI+DQotLS0g
YS9pbmNsdWRlL3RzdF90ZXN0X21hY3Jvcy5oPGJyPg0KKysrIGIvaW5jbHVkZS90c3RfdGVzdF9t
YWNyb3MuaDxicj4NCkBAIC0xMzIsNiArMTMyLDM0IEBAIGV4dGVybiB2b2lkICpUU1RfUkVUX1BU
Ujs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBUU1RfTVNHXyhUUEFT
UywgJnF1b3Q7IHBhc3NlZCZxdW90OywgI1NDQUxMLCAjI19fVkFfQVJHU19fKTvCoCDCoCDCoFw8
YnI+DQrCoCDCoCDCoCDCoCB9IHdoaWxlICgwKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFw8YnI+DQo8YnI+DQorPGJyPg0KKyNkZWZpbmUgVFNUX0VYUF9WQUxfU0lMRU5UXyhTQ0FM
TCwgU1NDQUxMLCBWQUwsIC4uLinCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFw8YnI+DQorwqAgwqAgwqAgwqBkbyB7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVEVTVChTQ0FMTCk7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBUU1RfUEFTUyA9IDA7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKFRTVF9SRVQgIT0gVkFMKSB7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9NU0dQXyhURkFJTCB8IFRURVJS
Tk8sICZxdW90OyByZXR2YWwgbm90ICVsZCZxdW90OyzCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKGxvbmcgKVZB
TCwgU1NDQUxMLCAjI19fVkFfQVJHU19fKTvCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRTVF9QQVNTID0g
MTvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqB9IHdoaWxl
ICgwKTxicj4NCis8YnI+DQorI2RlZmluZSBUU1RfRVhQX1ZBTF9TSUxFTlQoU0NBTEwsIFZBTCwg
Li4uKSBUU1RfRVhQX1ZBTF9TSUxFTlRfKFNDQUxMLCAjU0NBTEwsIFZBTCwgIyNfX1ZBX0FSR1Nf
Xyk8YnI+DQorPGJyPg0KKyNkZWZpbmUgVFNUX0VYUF9WQUwoU0NBTEwsIFZBTCwgLi4uKcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgXDxicj4NCivCoCDCoCDCoCDCoGRvIHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUU1RfRVhQX1ZBTF9T
SUxFTlQoU0NBTEwsIFZBTCwgIyNfX1ZBX0FSR1NfXyk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoVFNUX1BBU1Mp
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFRTVF9NU0dfKFRQQVNTLCAmcXVvdDsgcGFzc2VkJnF1b3Q7LCAjU0NBTEwsICMjX19WQV9B
UkdTX18pO8KgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgfSB3aGlsZSgwKTxi
cj4NCis8YnI+DQrCoCNkZWZpbmUgVFNUX0VYUF9GQUlMXyhQQVNTX0NPTkQsIFNDQUxMLCBTU0NB
TEwsIEVSUk5PLCAuLi4pwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCsKgIMKg
IMKgIMKgIGRvIHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBURVNUKFNDQUxMKTvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFw8YnI+DQotLTxicj4NCjIuMjAuMTxicj4NCjxicj4NCjxicj4NCjxicj4NCjxicj4NCi0t
IDxicj4NCk1haWxpbmcgbGlzdCBpbmZvOiA8YSBocmVmPSJodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHA8L2E+PGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwv
ZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4tLSA8YnI+PGRpdiBkaXI9Imx0ciIg
Y2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj5SZWdhcmRzLDxicj48
L2Rpdj48ZGl2PkxpIFdhbmc8YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--0000000000005634e405cac3d461--


--===============0847425270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0847425270==--

