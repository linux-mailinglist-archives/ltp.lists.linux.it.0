Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D221C3F96F4
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:28:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78EE53C93B2
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:28:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C7A6D3C29EF
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:28:13 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7985A1401201
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630056490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=88bIxbjntd9NmeH8beP4iK5vWm+2wFSSvjOhp7MC+ho=;
 b=RYF40ConZpOXufm61cBpfGweCHqW5zSL2BHygLe2U5RKwvuZQ9mwywOCAAsT2mHSZu73wr
 7U8PW0X4Z422lQHJoATSe5Q7KXJb5diIReQRj4SbSMtjgV9PjiLCqvQf0fZsWYd9f+Fw14
 cYNTsYOHKLN3ToPNnArrPqlGS8eY61U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-H6gNJRcpOY6w8UNGE5cY3g-1; Fri, 27 Aug 2021 05:28:06 -0400
X-MC-Unique: H6gNJRcpOY6w8UNGE5cY3g-1
Received: by mail-yb1-f199.google.com with SMTP id
 j9-20020a2581490000b02905897d81c63fso2856300ybm.8
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 02:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88bIxbjntd9NmeH8beP4iK5vWm+2wFSSvjOhp7MC+ho=;
 b=Kif6h0P4sw+BJoH81dA7IunL43AmYJmPqCz0dHRhr476UmrT5u6QRTu32C7bZUD9uE
 8Gk7jso14JTa7akMVaRhyYkjubfBbnVl+A2NitAKPnBe9ATXYZOCXmd/AU10PmyJBcON
 Glo6G5P2mz/+Z2FZwW6NqeBFzWZJiFRPqzvHqwmccZDbNJCEsANoxOozvUshaMxtqbOJ
 jL1nDt8+0y9ODa3evuqzNhIJXDWLNdN3AQTzq2coKfuHVGa1dVDKHVYlb8p2e8k9THJJ
 gIdj/wFoHidHMJjbABQ7QvmuTXY5RKO2jrwUxzalHFMRKPtxoTw9XvvNAtgbYeQ0b767
 WiDw==
X-Gm-Message-State: AOAM533y2JVVVoI8Uf+pWJuZAtuiLWkJPcFadi1B162czkitv7zkquDJ
 laUPuCiJJRr2WTdLURIBeOPq1s+aXunUvOv4B0b0iZ4MtzgNlYfp3nQPrZsBVYzp00GI/GtJB3R
 bdJ/0jUn5IFhOgKYWNwHOXljbTOM=
X-Received: by 2002:a5b:791:: with SMTP id b17mr4093300ybq.286.1630056486368; 
 Fri, 27 Aug 2021 02:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/UTwSPO0YLC6WzsPAJyt4/zbpH/E8cT5Gj76GvTTVN1lW8aEj3WHUlfhjZHCTsnuuH8Bqu71lV7PN2/Tgt78=
X-Received: by 2002:a5b:791:: with SMTP id b17mr4093277ybq.286.1630056486133; 
 Fri, 27 Aug 2021 02:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210827023042.26143-1-zhanglianjie@uniontech.com>
In-Reply-To: <20210827023042.26143-1-zhanglianjie@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 27 Aug 2021 17:27:54 +0800
Message-ID: <CAEemH2eVmWa-D+joV6E1F8RwYvrao-GK+jjU-+g6kyQOhhOSXg@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH] tst_test_macros.h: Add TST_EXP_VAL macro
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
Content-Type: multipart/mixed; boundary="===============0947746526=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0947746526==
Content-Type: multipart/alternative; boundary="000000000000d1f5fc05ca87199a"

--000000000000d1f5fc05ca87199a
Content-Type: text/plain; charset="UTF-8"

Hi Lianjie,

Some queries:

Do we have test scenarios for making use of these macros?

And can you write a test to verify the macros you added at the same time?
(just like what we had done in test_macros0*.c)

Btw, you should keep the code indent consistent with the original.
(especially for backlash \)


On Fri, Aug 27, 2021 at 10:31 AM zhanglianjie <zhanglianjie@uniontech.com>
wrote:

> Add TST_EXP_VAL to determine whether the return value
> is equal to the given value.
>
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 50598aa15..d23455362 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -132,6 +132,34 @@ extern void *TST_RET_PTR;
>                         TST_MSG_(TPASS, " passed", #SCALL,
> ##__VA_ARGS__);     \
>         } while (0)
>     \
>
> +
> +#define TST_EXP_VAL_SILENT_(SCALL, SSCALL, VAL, ...)                    \
> +       do {
>   \
> +               TEST(SCALL);
>       \
> +                                                                        \
> +               TST_PASS = 0;
>      \
> +                                                                        \
> +               if (TST_RET != VAL) {
>      \
> +                       TST_MSGP_(TFAIL | TTERRNO, " retval not %ld",
>          \
> +                                 (long )VAL, SSCALL, ##__VA_ARGS__);
>          \
> +                       break;
>           \
> +               }
>      \
> +                                                                        \
> +               TST_PASS = 1;
>      \
> +                                                                        \
> +       } while (0)
> +
> +#define TST_EXP_VAL_SILENT(SCALL, VAL, ...) TST_EXP_VAL_SILENT_(SCALL,
> #SCALL, VAL, ##__VA_ARGS__)
> +
> +#define TST_EXP_VAL(SCALL, VAL, ...)                                    \
> +       do {
>   \
> +               TST_EXP_VAL_SILENT(SCALL, VAL, ##__VA_ARGS__);
>       \
> +                                                                        \
> +               if (TST_PASS)
>      \
> +                       TST_MSG_(TPASS, " passed", #SCALL,
> ##__VA_ARGS__);          \
> +                                                                        \
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

--000000000000d1f5fc05ca87199a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SGkgTGlhbmppZSw8L2Rpdj48ZGl2IGNsYXNzPSJnbWFp
bF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0i
Z21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+U29tZSBxdWVyaWVzOjwvZGl2
PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPjxicj48
L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj5E
byB3ZSBoYXZlIHRlc3Qgc2NlbmFyaW9zwqBmb3IgbWFraW5nIHVzZSBvZiB0aGVzZSBtYWNyb3M/
PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+
PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21h
bGwiPkFuZCBjYW4geW91IHdyaXRlIGEgdGVzdCB0byB2ZXJpZnkgdGhlIG1hY3JvcyB5b3UgYWRk
ZWQgYXQgdGhlIHNhbWUgdGltZT88L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHls
ZT0iZm9udC1zaXplOnNtYWxsIj4oanVzdCBsaWtlIHdoYXQgd2UgaGFkIGRvbmUgaW4gdGVzdF9t
YWNyb3MwKi5jKTwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNp
emU6c21hbGwiPjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9u
dC1zaXplOnNtYWxsIj5CdHcsIHlvdSBzaG91bGQga2VlcCB0aGUgY29kZSBpbmRlbnQgY29uc2lz
dGVudCB3aXRoIHRoZSBvcmlnaW5hbC48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBz
dHlsZT0iZm9udC1zaXplOnNtYWxsIj4oZXNwZWNpYWxseSBmb3IgYmFja2xhc2ggXCk8L2Rpdj48
ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48YnI+PC9k
aXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfYXR0ciI+T24gRnJpLCBBdWcgMjcsIDIwMjEgYXQgMTA6MzEgQU0gemhhbmdsaWFu
amllICZsdDs8YSBocmVmPSJtYWlsdG86emhhbmdsaWFuamllQHVuaW9udGVjaC5jb20iIHRhcmdl
dD0iX2JsYW5rIj56aGFuZ2xpYW5qaWVAdW5pb250ZWNoLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+QWRkIFRTVF9FWFBfVkFMIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSByZXR1
cm4gdmFsdWU8YnI+DQppcyBlcXVhbCB0byB0aGUgZ2l2ZW4gdmFsdWUuPGJyPg0KPGJyPg0KU2ln
bmVkLW9mZi1ieTogemhhbmdsaWFuamllICZsdDs8YSBocmVmPSJtYWlsdG86emhhbmdsaWFuamll
QHVuaW9udGVjaC5jb20iIHRhcmdldD0iX2JsYW5rIj56aGFuZ2xpYW5qaWVAdW5pb250ZWNoLmNv
bTwvYT4mZ3Q7PGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X3Rlc3RfbWFjcm9z
LmggYi9pbmNsdWRlL3RzdF90ZXN0X21hY3Jvcy5oPGJyPg0KaW5kZXggNTA1OThhYTE1Li5kMjM0
NTUzNjIgMTAwNjQ0PGJyPg0KLS0tIGEvaW5jbHVkZS90c3RfdGVzdF9tYWNyb3MuaDxicj4NCisr
KyBiL2luY2x1ZGUvdHN0X3Rlc3RfbWFjcm9zLmg8YnI+DQpAQCAtMTMyLDYgKzEzMiwzNCBAQCBl
eHRlcm4gdm9pZCAqVFNUX1JFVF9QVFI7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgVFNUX01TR18oVFBBU1MsICZxdW90OyBwYXNzZWQmcXVvdDssICNTQ0FMTCwgIyNf
X1ZBX0FSR1NfXyk7wqAgwqAgwqBcPGJyPg0KwqAgwqAgwqAgwqAgfSB3aGlsZSAoMCnCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KPGJyPg0KKzxicj4NCisjZGVmaW5lIFRT
VF9FWFBfVkFMX1NJTEVOVF8oU0NBTEwsIFNTQ0FMTCwgVkFMLCAuLi4pwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoGRvIHvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVEVTVChT
Q0FMTCk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgVFNUX1BBU1MgPSAwO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKFRTVF9SRVQgIT0gVkFMKSB7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNUX01TR1BfKFRGQUlMIHwgVFRFUlJOTywgJnF1
b3Q7IHJldHZhbCBub3QgJWxkJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoChsb25nIClW
QUwsIFNTQ0FMTCwgIyNfX1ZBX0FSR1NfXyk7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRT
VF9QQVNTID0gMTvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoH0gd2hp
bGUgKDApPGJyPg0KKzxicj4NCisjZGVmaW5lIFRTVF9FWFBfVkFMX1NJTEVOVChTQ0FMTCwgVkFM
LCAuLi4pIFRTVF9FWFBfVkFMX1NJTEVOVF8oU0NBTEwsICNTQ0FMTCwgVkFMLCAjI19fVkFfQVJH
U19fKTxicj4NCis8YnI+DQorI2RlZmluZSBUU1RfRVhQX1ZBTChTQ0FMTCwgVkFMLCAuLi4pwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4N
CivCoCDCoCDCoCDCoGRvIHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBc
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFNUX0VYUF9WQUxfU0lMRU5UKFNDQUxMLCBW
QUwsICMjX19WQV9BUkdTX18pO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChUU1RfUEFTUynCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUU1RfTVNHXyhUUEFTUywg
JnF1b3Q7IHBhc3NlZCZxdW90OywgI1NDQUxMLCAjI19fVkFfQVJHU19fKTvCoCDCoCDCoCDCoCDC
oCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFw8YnI+DQorwqAgwqAgwqAgwqB9IHdoaWxlKDApPGJyPg0KKzxicj4NCsKgI2RlZmluZSBU
U1RfRVhQX0ZBSUxfKFBBU1NfQ09ORCwgU0NBTEwsIFNTQ0FMTCwgRVJSTk8sIC4uLinCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KwqAgwqAgwqAgwqAgZG8ge8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFRFU1QoU0NBTEwpO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCi0tPGJyPg0KMi4y
MC4xPGJyPg0KPGJyPg0KPGJyPg0KPGJyPg0KPGJyPg0KLS0gPGJyPg0KTWFpbGluZyBsaXN0IGlu
Zm86IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cDwvYT48YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxk
aXY+PGJyPjwvZGl2Pi0tIDxicj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PlJl
Z2FyZHMsPGJyPjwvZGl2PjxkaXY+TGkgV2FuZzxicj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4N
Cg==
--000000000000d1f5fc05ca87199a--


--===============0947746526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0947746526==--

