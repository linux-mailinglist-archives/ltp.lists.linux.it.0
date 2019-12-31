Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332B12D6D7
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:41:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF5073C239D
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:41:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 473053C18F9
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:41:19 +0100 (CET)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CA6D91A02417
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:41:18 +0100 (CET)
Received: by mail-lj1-x244.google.com with SMTP id l2so35573452lja.6
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 23:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NF8xGzMvdZfpgzra58jQGRelnsYZWlWOPYEvG4u8o7Q=;
 b=oz/YgTjNj9/wtn4+Xcnm8sMd2su2adoOl9yTjJOVBjoS7PeMi/PFFVtZvBLBWxWZh0
 c0wHSqt2iS/a1Bv5gaoDMYERLfyv/4lv7s2sHi2Zi3vSte2M8tQ5bKE4CdMA1ub7LoRi
 TtIv1LDXfDED99Av0VtjDKYnsiQgkGcF/Wggtv1jzIcV/ABqCGKh96aoghiSsMPuqW63
 u8gLnzQXBu/+IP7dsqOuGQ/S/CTp6/xqE8Un9b0RWfNEi/qiO3R7UyxulVdKApSj51Ie
 GaSuhr9HalzUYyk5xJWLRV4eLxICWDznhtNlDl2dp6OWUuaG5KhFhSZW21kX7FdgE8E3
 Jn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NF8xGzMvdZfpgzra58jQGRelnsYZWlWOPYEvG4u8o7Q=;
 b=nXgV9QKHG+WhF+33c+scAawWFRoEORbpAQwhmhS4qcN9jOAOTE7RMW+VYrgoW/sXoY
 lrTaZ3/tPlfZwUNURjBvuhfXMbQRi1pia8OI9QXfFZ4BkryDDlq3jGoeqBCL/2xIlZIo
 HUCUrHur8lm+mJ8IwZ/+5bfxhHUUWHjOUV3QWaf3YK9H0E4hh3HzAUEN+trlZk272WQU
 6f6OmeQoMgLQyuW/DjEQkguU99LnvVzdsReoVJ9uUlqOIJuqF8N+oAR98is+9AEAGbgn
 VvMYw5vIMVbUNKgLmpYuanT+LMgFg+mFEYuXG/JRQ2Yp0eb7bbWIkHUwKCrxXOUHHYAA
 vnEg==
X-Gm-Message-State: APjAAAXh6LpOfPX4MoJVKIPnuSXULqGG95PzivqSP4B9uYY5omS66+5y
 PS9oCSlA5JLT0LOKYNG0kZqoV7qp53nKwsVJGFyu7A==
X-Google-Smtp-Source: APXvYqxshIKSHSgDbWy65y+vjW3Yl1h4/oQmeMulXa7b5P/r5foOTiXmL8JEmz8VBDcGC+OkDq538PxVfHedXYmdIkY=
X-Received: by 2002:a2e:8316:: with SMTP id a22mr584539ljh.141.1577778077975; 
 Mon, 30 Dec 2019 23:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
 <23f8d05b-efff-56ba-b5d8-f99046e5619c@cn.fujitsu.com>
 <CAEemH2dyHSS20Lf9neVfY6voN-EO60_MQdXjb0Xjy9VsDfbZwA@mail.gmail.com>
 <d3baf4e5-66cb-6288-6742-0f7d1dc89090@cn.fujitsu.com>
 <CAEemH2fE=+6qi8P8wu6CDOkS1NOCWTTTmKeSBiRDWiu0qGhTOw@mail.gmail.com>
In-Reply-To: <CAEemH2fE=+6qi8P8wu6CDOkS1NOCWTTTmKeSBiRDWiu0qGhTOw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 31 Dec 2019 13:11:05 +0530
Message-ID: <CAFA6WYMvkbZYEzDv_3WYDMNx4kMeY1Zp0VYi8wx0bpDAZh93Fg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: Caspar Zhang <caspar@linux.alibaba.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCAzMSBEZWMgMjAxOSBhdCAxMzowMiwgTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+
IHdyb3RlOgo+Cj4KPgo+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDM6MDUgUE0gWWFuZyBYdSA8
eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4gd3JvdGU6Cj4+Cj4+IC4uLgo+PiA+PiAgICAg
SSBoYXZlIHRyaWVkIHRoaXMgZm9yIG1hbnkgZGlmZmVyZW50IHN5c3RlbXMsIGFuZCBpdCBkb2Vz
bid0IGhpdAo+PiA+PiAgICAgdGhlIGZhaWx1cmUgYXQgbGVhc3Qgb25lIHRpbWUuIFNvIGlmIG5v
IG1vcmUgY29tbWVudHMsIEkgd291bGQKPj4gPj4gICAgIG1lcmdlIHRoZSBwYXRjaCBhcyBiZWxv
dyBpbiB0aGUgbmV4dCBzdGVwLgo+PiA+Cj4+ID4gICAgIEkgaGF2ZSBhIHF1ZXN0aW9uLndlIG11
c3QgY2FsbCBzeW5jKCk/IEkgdGhpbmsgc3luY2ZzIGlzIG1vcmUgYWNjdXJhdGUuCj4+ID4KPj4g
Pgo+PiA+IEhlcmUgd2UgdXNlIHN5bmMoKSBpcyB0byBtYWtlIGZzIG1ldGFkYXRhL2NhY2hlIGJl
aW5nIHdyaXR0ZW4gYmFjawo+PiA+IGJlZm9yZSB0ZXN0aW5nIGJlY2F1c2UgdGhlcmUgaXMgbm8g
b2J0YWluYWJsZSBmaWxlIGRlc2NyaXB0b3IgJ2ZkJyBmb3IKPj4gPiB0aGUgZXh0NCBkZWZlcnJl
ZCBJTyAoZS5nLiBpbml0aWFsaXplIHRoZSBqb3VybmFsIGFuZCBpbm9kZSB0YWJsZXMpLgo+Cj4K
Pj4KPj4gSSBzZWUuIEZvciBvdGhlciB0ZXN0IGNhc2VzIHVzaW5nIHRzdF9kZXZfYnl0ZXNfd3Jp
dHRlbiBhcGkgc3VjaCBhcwo+PiBmZGF0YXN5bmMwMy5jLCAgd2UgYWxzbyBuZWVkIHRvIGNhbGwg
c3luYygpIHRvIG1ha2UgdGhpcyB3cml0dGVuIHZhbHVlCj4+IG1vcmUgYWNjdXJhdGUuICBXaGF0
IGRvIHlvdSB0aGluayBhYm91dCBpdO+8nwo+Cj4KPiBHb29kIHBvaW50LiBJIHRoaW5rIHdlIHNo
b3VsZCB0YWtlIGNhcmUgb2YgdGhlbSBhcyB3ZSBkbyBmb3Igc3luY19maWxlX3JhbmdlMDIgdG9v
LiBJdCB3aWxsIG1vcmUgZWFzaWx5IHJlcG9ydCBmYWlsIGluIHRoZSBjYXNlIG9mIGEgc2l0dWF0
aW9uIHRoYXQgc3luY2VkIGRhdGEgaXMgbGVzcyB0aGFuIGV4cGVjdGVkLgo+Cj4gJCBnaXQgZ3Jl
cCB0c3RfZGV2X2J5dGVzX3dyaXR0ZW4KPiBrZXJuZWwvc3lzY2FsbHMvZmRhdGFzeW5jL2ZkYXRh
c3luYzAzLmM6ICAgICAgICB0c3RfZGV2X2J5dGVzX3dyaXR0ZW4odHN0X2RldmljZS0+ZGV2KTsK
PiBrZXJuZWwvc3lzY2FsbHMvZmRhdGFzeW5jL2ZkYXRhc3luYzAzLmM6ICAgICAgICB3cml0dGVu
ID0gdHN0X2Rldl9ieXRlc193cml0dGVuKHRzdF9kZXZpY2UtPmRldik7Cj4ga2VybmVsL3N5c2Nh
bGxzL2ZzeW5jL2ZzeW5jMDQuYzogICAgICAgIHRzdF9kZXZfYnl0ZXNfd3JpdHRlbih0c3RfZGV2
aWNlLT5kZXYpOwo+IGtlcm5lbC9zeXNjYWxscy9mc3luYy9mc3luYzA0LmM6ICAgICAgICB3cml0
dGVuID0gdHN0X2Rldl9ieXRlc193cml0dGVuKHRzdF9kZXZpY2UtPmRldik7Cj4ga2VybmVsL3N5
c2NhbGxzL3N5bmMvc3luYzAzLmM6ICB0c3RfZGV2X2J5dGVzX3dyaXR0ZW4odHN0X2RldmljZS0+
ZGV2KTsKPiBrZXJuZWwvc3lzY2FsbHMvc3luYy9zeW5jMDMuYzogIHdyaXR0ZW4gPSB0c3RfZGV2
X2J5dGVzX3dyaXR0ZW4odHN0X2RldmljZS0+ZGV2KTsKPiBrZXJuZWwvc3lzY2FsbHMvc3luY19m
aWxlX3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAyLmM6ICAgIHRzdF9kZXZfYnl0ZXNfd3JpdHRlbih0
c3RfZGV2aWNlLT5kZXYpOwo+IGtlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19m
aWxlX3JhbmdlMDIuYzogICAgd3JpdHRlbiA9IHRzdF9kZXZfYnl0ZXNfd3JpdHRlbih0c3RfZGV2
aWNlLT5kZXYpOwo+IGtlcm5lbC9zeXNjYWxscy9zeW5jZnMvc3luY2ZzMDEuYzogICAgICB0c3Rf
ZGV2X2J5dGVzX3dyaXR0ZW4odHN0X2RldmljZS0+ZGV2KTsKPiBrZXJuZWwvc3lzY2FsbHMvc3lu
Y2ZzL3N5bmNmczAxLmM6ICAgICAgd3JpdHRlbiA9IHRzdF9kZXZfYnl0ZXNfd3JpdHRlbih0c3Rf
ZGV2aWNlLT5kZXYpOwo+CgpBZ3JlZS4KCi1TdW1pdAoKPiAtLQo+IFJlZ2FyZHMsCj4gTGkgV2Fu
ZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
