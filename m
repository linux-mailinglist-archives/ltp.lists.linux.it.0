Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 686BA87F86B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Mar 2024 08:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1710833396; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=VXQOwLQAcLzaR8MPOJ3+1tq/A2XFTcRjiDZ7FlWGXIc=;
 b=Hv3VracP0UM6IjFG1ATaaplpi4rjzVAApHE2y+VkTfs9UCSo0jfp0w6MaMr5sDN7lh2Wg
 Eg8ae4ZqxwDPlcX5kkKQ8JIZU4i3DTX7hqMhAjEAoZ7rDsim4vQOM4AEHRrklbLVRv5QVKx
 d9RGGK4FcC1SUoCSRkUKz2/iiG9qiHE=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E0EC3CE68F
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Mar 2024 08:29:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9FFA3C06AC
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 08:29:53 +0100 (CET)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2C8FE600A53
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 08:29:52 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a4682272ff6so430161066b.2
 for <ltp@lists.linux.it>; Tue, 19 Mar 2024 00:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1710833391; x=1711438191; darn=lists.linux.it;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=40p1W4fjsSopvR5NupUlbbDxtw0F4OFmoTAACJkRzDU=;
 b=dLgvPb0//bU08r1FNmk/fonQCBQN2G+oA5xcCGudhHTWHj0eDL6NOJmAeCkKvrzL5p
 sHuXuRuF7Yv4XnvJbEfJKU5OpUg2W4GfCGL51aQ++syGtsTouEHsnsG7c2lxJ2+TAHyG
 8QSZ6QelCtizYvwAYbm5mlQuAF2/NJoWgFPz+6zw9jeukz18ol1TJ5ugv2OI6yM3Vt8T
 29BJwpHISt611nvLP7dLNJiaa2+x91/PKWKfFhmDCFizF7SlBI89nldkqX/LpwtvcG/b
 YT3C6jwak6rEBCco7eNUGh9Xc0+VWNk63JbdjJLNfNGbC1dQhom7EwNgomneywZIqNBT
 wVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710833391; x=1711438191;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40p1W4fjsSopvR5NupUlbbDxtw0F4OFmoTAACJkRzDU=;
 b=dTdCf1YYMSU9CPUB+c2TaGjVCOfuGrkbaZvXRn1XQBwEWC5aODs1BOHL7YgZ2rGK9u
 7r38gUeaNAYukd/iUGAsPOKrEqXUJiLPq41qhoCaaTWhS9OqttEJ2lljfTd7pYY9BkCx
 ihKSiyQ1Y8dlz6FMILPYmAraENEfHqNXgZ76JVS6nlMEd8K77DAbbNmc1RLzEMWI7mVq
 aP4VXBi6ell0wgoTOdeJDOsHavC1jnVnIJ8wIW0OJamT6Duir0YhZ3piSHwezqDGxOmJ
 hlWmlV9tymkRtji9aCuj8RkKBiouxk6AQH1lYq+8EJXthFIjmCuHImgtklMRLY4HBPJN
 MOvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR1sLcZcoa0DQch6GffcuNs07i4HS2dIv8NkaJLDNs2d3XP+HVvTJigrbqTU+/zfYHK9++iIyvK1smyecSqaxOcdU=
X-Gm-Message-State: AOJu0YxUYhMFTzXe5cuY+hs2h6YBOzHMfExoz5/Rn01wDxf6igD0AQ4u
 YkvIP6Bemj4sgBUEcTag4PiEWDh/SAHo5hc2bCxv9Per68isFX5udC0DNfWV0g==
X-Google-Smtp-Source: AGHT+IGO8Hhkf5iVjuUdK6a+gxzhxav6FpylnxMqrA+kI+lLdx3CK0TyU5XdAHkLhK8a3Hisqk/NUw==
X-Received: by 2002:a17:906:548d:b0:a46:557b:c72c with SMTP id
 r13-20020a170906548d00b00a46557bc72cmr8458506ejo.8.1710833391491; 
 Tue, 19 Mar 2024 00:29:51 -0700 (PDT)
Received: from wegao.122.217.52 ([81.95.8.245])
 by smtp.gmail.com with ESMTPSA id
 ak8-20020a170906888800b00a46b4544da2sm2729488ejc.125.2024.03.19.00.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 00:29:51 -0700 (PDT)
Date: Tue, 19 Mar 2024 03:29:44 -0400
To: Li Wang <liwang@redhat.com>
Message-ID: <Zfk+6IbMolZPGRvy@wegao.122.217.52>
References: <CAEemH2d_DgJwFrnu2e91ip6FhdDPjYddCQNsqnf=dA5QjuW_qg@mail.gmail.com>
 <ZfezDUSKwUdoSamA@wegao.215.20.80>
 <CAEemH2cLfO9nMnOdB3wTuK6bmkfsPJp_fdQOXSFU-SfHfdQSZA@mail.gmail.com>
 <Zffm+yWYrGhyVTsf@wegao.213.190.243>
 <CAEemH2e4iC1+dViTu4WgNz4-BOTg+f9+9sggy+WKhK+ZsCQmvQ@mail.gmail.com>
 <Zfg2E59Pa1uF84di@wegao.115.61.67>
 <CAEemH2c--aHRW5ZqvBZTP2AVuoiKcY4x6GAxcaMb1KgbXVUEDA@mail.gmail.com>
 <20240319050357.GA417761@pevik>
 <CAEemH2eoeuvZB+=9iG0qJ6_2OSAN9S_7R+hq+i1pXFXmY4j_jQ@mail.gmail.com>
 <CAEemH2etj26fEXV7jk3jC=RcU=v18qDpkskhVOr8bDW5Fma4vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2etj26fEXV7jk3jC=RcU=v18qDpkskhVOr8bDW5Fma4vQ@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] swapon01: swapon01: prevent OOM happening in swap
 process
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMDE6NTE6MTBQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUdWUsIE1hciAxOSwgMjAyNCBhdCAxOjQz4oCvUE0gTGkgV2FuZyA8bGl3YW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+IAo+ID4KPiA+Cj4gPiBPbiBUdWUsIE1hciAxOSwgMjAyNCBhdCAxOjA0
4oCvUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgo+ID4KPiA+PiA+IE9uIE1v
biwgTWFyIDE4LCAyMDI0IGF0IDg6NDDigK9QTSBXZWkgR2FvIDx3ZWdhb0BzdXNlLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+Pgo+ID4+Cj4gPj4KPiA+PiA+ID4gPiBUaGF0J3MgYmVjYXVzZSB0aGUgYXZh
aWxhYmxlIHN3YXBmaWxlIG9uIHlvdXIgU1VUIGlzIHRvbyBzbWFsbCwKPiA+PiA+ID4gPiB5b3Ug
Y2FuIGFkanVzdCBpdCAodGhlbiByZXRlc3QgaXQpIGJ5IHlvdXJzZWxmIHRvIGZpbmQgYSBwcm9w
ZXIKPiA+PiBzaXplLgo+ID4+Cj4gPj4gPiA+ID4gVGhpcyBpcyBmaW5lIGFzIGxvbmcgYXMgdGhl
IHN3YXBmaWxlIHNpemUgaXMgbGVzcyB0aGFuIDMwME1CLAo+ID4+ID4gPiA+IG90aGVyd2lzZSB3
ZSBuZWVkIHRvIHNldCAuZGV2X21pbl9zaXplIGxpa2Ugd2hhdCB3ZSBkaWQKPiA+PiA+ID4gPiBm
b3Igc3dhcG9mZjAxLmMuCj4gPj4KPiA+PiA+ID4gPiBBbmQsIG9uIHRoZSBvdGhlciBzaWRlLCB3
ZSBjYW4ndCBndWFyYW50ZWUgdGhlIHN5c3RlbSBTd2FwQ2FjaGVkCj4gPj4gPiA+ID4gaGFwcGVu
ZWQgZXZlcnkgdGltZSwgaXQgZGVwZW5kcyBvbiB0aGUgc3lzdGVtJ3MgY29uZmlndXJhdGlvbi4K
PiA+Pgo+ID4+Cj4gPj4gPiA+IDEwME0gaXMgZ29vZCBlbm91Z2ggZm9yIGN1cnJlbnQgc3lzdGVt
LCBjb3VsZCB5b3UgaGVscCBjaGVjayBmb2xsb3dpbmcKPiA+PiA+ID4gcGF0Y2g/Cj4gPj4KPiA+
Pgo+ID4+ID4gQ2FuIHdlIHJld3JpdGUgdGhlIG1ha2Vfc3dhcGZpbGUoKSBBUEkgdG8gc3VwcG9y
dCBwYXNzaW5nIE1CIHNpemUgZm9yCj4gPj4gPiBtYWtpbmcgdGhlIHN3YXBmaWxlPwo+ID4+Cj4g
Pj4gSSBndWVzcyBpdCB3b3VsZCBiZSBkZXNpcmFibGUgKGJ1dCBrZWVwIGFsc28gcG9zc2libGUg
dG8gcGFzcyB0aGF0IDEwCj4gPj4gYmxvY2tzLAo+ID4+IHRoZXJlZm9yZSBtYXliZSB1c2UgZmxh
ZyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIE1CIGFuZCBibG9ja3M/KS4KPiA+Pgo+ID4KPiA+IFRo
YXQncyBmaW5lIGJ1dCBhIGJpdCBjb21wbGV4IGZvciB1c2VycyB0byBkaXN0aW5ndWlzaCBmbGFn
cy4KPiA+Cj4gPiBPciwgd2hhdCBhYm91dCBtYWtpbmcgdGhlIGZ1bmN0aW9uIHVzZSB0aGUgZmxh
ZyBhcyBzdGF0aWMsIGFuZAo+ID4gZXhwb3J0IHR3byBhZGRpdGlvbmFsIGZ1bmN0aW9ucyB3aXRo
IE1CIGFuZCBibG9ja3M/Cj4gPgo+ID4gZW51bSBzd2FwZmlsZV9tZXRob2Qgewo+ID4gICAgIFNX
QVBGSUxFX0JZX1NJWkUsCj4gPiAgICAgU1dBUEZJTEVfQllfQkxPQ0tTCj4gPiB9Owo+ID4KPiA+
IHN0YXRpYyBpbnQgbWFrZV9zd2FwZmlsZShjb25zdCBjaGFyICpzd2FwZmlsZSwgdW5zaWduZWQg
aW50IHBhcmEsIGludAo+ID4gc2FmZSwgZW51bSBzd2FwZmlsZV9tZXRob2QgbWV0aG9kKSB7Cj4g
PiAgICAgLy8gVGhlIG1haW4gbG9naWMgdG8gYWNoaWV2ZSB0aGUgc3dhcGZpbGUtbWFraW5nIHBy
b2Nlc3MKPiA+ICAgICAvLyAuLi4KPiA+IH0KPiA+Cj4gPiBpbnQgbWFrZV9zd2FwZmlsZV9zaXpl
KGNvbnN0IGNoYXIgKnN3YXBmaWxlLCB1bnNpZ25lZCBpbnQgc2l6ZSwgaW50IHNhZmUpIHsKPiA+
ICAgICByZXR1cm4gbWFrZV9zd2FwZmlsZShzd2FwZmlsZSwgc2l6ZSwgc2FmZSwgU1dBUEZJTEVf
QllfU0laRSk7Cj4gPiB9Cj4gPgo+ID4gaW50IG1ha2Vfc3dhcGZpbGVfYmxrcyhjb25zdCBjaGFy
ICpzd2FwZmlsZSwgdW5zaWduZWQgaW50IGJsb2NrcywgaW50Cj4gPiBzYWZlKSB7Cj4gPiAgICAg
cmV0dXJuIG1ha2Vfc3dhcGZpbGUoc3dhcGZpbGUsIGJsb2Nrcywgc2FmZSwgU1dBUEZJTEVfQllf
QkxPQ0tTKTsKPiA+IH0KPiA+Cj4gCj4gRXZlbiBzaW1wbGVyIHRvIGRlZmluZSB0d28gbWFjcm9z
IHdpdGggb25lIG1ha2Vfc3dhcGZpbGUoKToKPiAKPiAjZGVmaW5lIE1BS0VfU1dBUEZJTEVfU0la
RShzd2FwZmlsZSwgc2l6ZSwgc2FmZSkgXAo+ICAgICBtYWtlX3N3YXBmaWxlKHN3YXBmaWxlLCBz
aXplLCBzYWZlLCBTV0FQRklMRV9CWV9TSVpFKQo+IAo+ICNkZWZpbmUgTUFLRV9TV0FQRklMRV9C
TEtTKHN3YXBmaWxlLCBibG9ja3MsIHNhZmUpIFwKPiAgICAgbWFrZV9zd2FwZmlsZShzd2FwZmls
ZSwgYmxvY2tzLCBzYWZlLCBTV0FQRklMRV9CWV9CTE9DS1MpCj4gCj4gCk1ha2UgYSBxdWljayBi
ZWxvdyBwYXRjaDoKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpYnN3YXAuaCBiL2luY2x1ZGUvbGli
c3dhcC5oCmluZGV4IDhjNzVlMjBhZS4uYzE1OTMwNjE1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
YnN3YXAuaAorKysgYi9pbmNsdWRlL2xpYnN3YXAuaApAQCAtMTQsNyArMTQsMTggQEAKIC8qCiAg
KiBNYWtlIGEgc3dhcCBmaWxlCiAgKi8KLWludCBtYWtlX3N3YXBmaWxlKGNvbnN0IGNoYXIgKnN3
YXBmaWxlLCBpbnQgYmxvY2tzLCBpbnQgc2FmZSk7CitlbnVtIHN3YXBmaWxlX21ldGhvZCB7Cisg
ICAgU1dBUEZJTEVfQllfU0laRSwKKyAgICBTV0FQRklMRV9CWV9CTE9DS1MKK307CisKK2ludCBt
YWtlX3N3YXBmaWxlKGNvbnN0IGNoYXIgKnN3YXBmaWxlLCB1bnNpZ25lZCBpbnQgcGFyYSwgaW50
IHNhZmUsIGVudW0gc3dhcGZpbGVfbWV0aG9kIG1ldGhvZCk7CisKKyNkZWZpbmUgTUFLRV9TV0FQ
RklMRV9TSVpFKHN3YXBmaWxlLCBzaXplLCBzYWZlKSBcCisgICAgbWFrZV9zd2FwZmlsZShzd2Fw
ZmlsZSwgc2l6ZSwgc2FmZSwgU1dBUEZJTEVfQllfU0laRSkKKworI2RlZmluZSBNQUtFX1NXQVBG
SUxFX0JMS1Moc3dhcGZpbGUsIGJsb2Nrcywgc2FmZSkgXAorICAgIG1ha2Vfc3dhcGZpbGUoc3dh
cGZpbGUsIGJsb2Nrcywgc2FmZSwgU1dBUEZJTEVfQllfQkxPQ0tTKQoKIC8qCiAgKiBDaGVjayBz
d2Fwb24vc3dhcG9mZiBzdXBwb3J0IHN0YXR1cyBvZiBmaWxlc3lzdGVtcyBvciBmaWxlcwpkaWZm
IC0tZ2l0IGEvbGlicy9saWJsdHBzd2FwL2xpYnN3YXAuYyBiL2xpYnMvbGlibHRwc3dhcC9saWJz
d2FwLmMKaW5kZXggYTI2ZWEyNWU0Li44ODM3NmJlMDUgMTAwNjQ0Ci0tLSBhL2xpYnMvbGlibHRw
c3dhcC9saWJzd2FwLmMKKysrIGIvbGlicy9saWJsdHBzd2FwL2xpYnN3YXAuYwpAQCAtMTMzLDE4
ICsxMzMsMjQgQEAgb3V0OgogICAgICAgIHJldHVybiBjb250aWd1b3VzOwogfQoKLWludCBtYWtl
X3N3YXBmaWxlKGNvbnN0IGNoYXIgKnN3YXBmaWxlLCBpbnQgYmxvY2tzLCBpbnQgc2FmZSkKK2lu
dCBtYWtlX3N3YXBmaWxlKGNvbnN0IGNoYXIgKnN3YXBmaWxlLCB1bnNpZ25lZCBpbnQgcGFyYSwg
aW50IHNhZmUsIGVudW0gc3dhcGZpbGVfbWV0aG9kIG1ldGhvZCkKIHsKICAgICAgICBzdHJ1Y3Qg
c3RhdHZmcyBmc19pbmZvOwogICAgICAgIHVuc2lnbmVkIGxvbmcgYmxrX3NpemUsIGJzOwogICAg
ICAgIHNpemVfdCBwZ19zaXplID0gc3lzY29uZihfU0NfUEFHRVNJWkUpOwogICAgICAgIGNoYXIg
bW50X3BhdGhbMTAwXTsKKyAgICAgICB1bnNpZ25lZCBpbnQgYmxvY2tzOwoKICAgICAgICBpZiAo
c3RhdHZmcygiLiIsICZmc19pbmZvKSA9PSAtMSkKICAgICAgICAgICAgICAgIHJldHVybiAtMTsK
CiAgICAgICAgYmxrX3NpemUgPSBmc19pbmZvLmZfYnNpemU7CgorICAgICAgIGlmIChtZXRob2Qg
PT0gU1dBUEZJTEVfQllfU0laRSkKKyAgICAgICAgICAgICAgIGJsb2NrcyA9IHBhcmEgKiAxMDI0
ICogMTAyNCAvIGJsa19zaXplOworICAgICAgIGVsc2UKKyAgICAgICAgICAgICAgIGJsb2NrcyA9
IHBhcmE7CisKICAgICAgICAvKiBUbyBndWFyYW50ZWUgYXQgbGVhc3Qgb25lIHBhZ2UgY2FuIGJl
IHN3YXBwZWQgb3V0ICovCiAgICAgICAgaWYgKGJsa19zaXplICogYmxvY2tzIDwgcGdfc2l6ZSkK
ICAgICAgICAgICAgICAgIGJzID0gcGdfc2l6ZTsKQEAgLTE4MSw3ICsxODcsNyBAQCBpbnQgbWFr
ZV9zd2FwZmlsZShjb25zdCBjaGFyICpzd2FwZmlsZSwgaW50IGJsb2NrcywgaW50IHNhZmUpCiBi
b29sIGlzX3N3YXBfc3VwcG9ydGVkKGNvbnN0IGNoYXIgKmZpbGVuYW1lKQogewogICAgICAgIGlu
dCBpLCBzd19zdXBwb3J0ID0gMDsKLSAgICAgICBpbnQgcmV0ID0gbWFrZV9zd2FwZmlsZShmaWxl
bmFtZSwgMTAsIDEpOworICAgICAgIGludCByZXQgPSBtYWtlX3N3YXBmaWxlKGZpbGVuYW1lLCAx
MCwgMSwgU1dBUEZJTEVfQllfQkxPQ0tTKTsKICAgICAgICBpbnQgZmlfY29udGlndW91cyA9IGZp
bGVfaXNfY29udGlndW91cyhmaWxlbmFtZSk7CiAgICAgICAgbG9uZyBmc190eXBlID0gdHN0X2Zz
X3R5cGUoZmlsZW5hbWUpOwogICAgICAgIGNvbnN0IGNoYXIgKmZzdHlwZSA9IHRzdF9mc190eXBl
X25hbWUoZnNfdHlwZSk7CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3
YXBvbi9zd2Fwb24wMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9u
MDEuYwppbmRleCBkNDA2ZTRiZDkuLjgyMzgxMzcxNCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jCkBAIC0zOCw3ICszOCw3IEBAIHN0YXRpYyB2b2lkIHZl
cmlmeV9zd2Fwb24odm9pZCkKIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiB7CiAgICAgICAgaXNf
c3dhcF9zdXBwb3J0ZWQoU1dBUF9GSUxFKTsKLSAgICAgICBtYWtlX3N3YXBmaWxlKFNXQVBfRklM
RSwgMTAsIDApOworICAgICAgIE1BS0VfU1dBUEZJTEVfU0laRShTV0FQX0ZJTEUsIDEwMCwgMCk7
CgogICAgICAgIFNBRkVfQ0dfUFJJTlRGKHRzdF9jZywgImNncm91cC5wcm9jcyIsICIlZCIsIGdl
dHBpZCgpKTsKICAgICAgICBTQUZFX0NHX1BSSU5URih0c3RfY2csICJtZW1vcnkubWF4IiwgIiVs
dSIsIFRFU1RNRU0pOwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fw
b24vc3dhcG9uMDIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAy
LmMKaW5kZXggN2U4NzZkMjZhLi5mNzZiYjI4Y2YgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb24vc3dhcG9uMDIuYwpAQCAtNTAsOCArNTAsOCBAQCBzdGF0aWMgdm9pZCBzZXR1
cCh2b2lkKQogICAgICAgIGlzX3N3YXBfc3VwcG9ydGVkKFRFU1RfRklMRSk7CgogICAgICAgIFNB
RkVfVE9VQ0goTk9UU1dBUF9GSUxFLCAwNzc3LCBOVUxMKTsKLSAgICAgICBtYWtlX3N3YXBmaWxl
KFNXQVBfRklMRSwgMTAsIDApOwotICAgICAgIG1ha2Vfc3dhcGZpbGUoVVNFRF9GSUxFLCAxMCwg
MCk7CisgICAgICAgTUFLRV9TV0FQRklMRV9CTEtTKFNXQVBfRklMRSwgMTAsIDApOworICAgICAg
IE1BS0VfU1dBUEZJTEVfQkxLUyhVU0VEX0ZJTEUsIDEwLCAwKTsKCiAgICAgICAgaWYgKHRzdF9z
eXNjYWxsKF9fTlJfc3dhcG9uLCBVU0VEX0ZJTEUsIDApKQogICAgICAgICAgICAgICAgdHN0X3Jl
cyhUV0FSTiB8IFRFUlJOTywgInN3YXBvbihhbHJlYWR5dXNlZCkgZmFpbGVkIik7CmRpZmYgLS1n
aXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMy5jIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYwppbmRleCA2ZjQ3ZmMwMWYuLmFh
YWVkZmExMSAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dh
cG9uMDMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMy5j
CkBAIC00OSw3ICs0OSw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfc3dhcCh2b2lkKQoKICAgICAgICAg
ICAgICAgICAgICAgICAgLyogQ3JlYXRlIHRoZSBzd2FwZmlsZSAqLwogICAgICAgICAgICAgICAg
ICAgICAgICBzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVuYW1lKSwgIiVzJTAyZCIsIFRF
U1RfRklMRSwgaiArIDIpOwotICAgICAgICAgICAgICAgICAgICAgICBtYWtlX3N3YXBmaWxlKGZp
bGVuYW1lLCAxMCwgMCk7CisgICAgICAgICAgICAgICAgICAgICAgIE1BS0VfU1dBUEZJTEVfQkxL
UyhmaWxlbmFtZSwgMTAsIDApOwoKICAgICAgICAgICAgICAgICAgICAgICAgLyogdHVybiBvbiB0
aGUgc3dhcCBmaWxlICovCiAgICAgICAgICAgICAgICAgICAgICAgIFRTVF9FWFBfUEFTU19TSUxF
TlQoc3dhcG9uKGZpbGVuYW1lLCAwKSk7CkBAIC02Miw3ICs2Miw3IEBAIHN0YXRpYyBpbnQgc2V0
dXBfc3dhcCh2b2lkKQogICAgICAgICAgICAgICAgdHN0X2JyayhURkFJTCwgIkZhaWxlZCB0byBz
ZXR1cCBzd2FwIGZpbGVzIik7CgogICAgICAgIHRzdF9yZXMoVElORk8sICJTdWNjZXNzZnVsbHkg
Y3JlYXRlZCAlZCBzd2FwIGZpbGVzIiwgc3dhcGZpbGVzKTsKLSAgICAgICBtYWtlX3N3YXBmaWxl
KFRFU1RfRklMRSwgMTAsIDApOworICAgICAgIE1BS0VfU1dBUEZJTEVfQkxLUyhURVNUX0ZJTEUs
IDEwLCAwKTsKCiAgICAgICAgcmV0dXJuIDA7CiB9Cgo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkg
V2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
