Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 369EE26868F
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 09:53:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74D113C4F20
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 09:53:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7AD4A3C24E4
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 09:53:15 +0200 (CEST)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5F93B200C71
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 09:53:14 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id x10so11148197ybj.13
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tPJS32njs1p0TAmh/zajoLaecsftajZZsMooXqDnxZ8=;
 b=Ow6fFLwWaE/JAX643w0JJE4NxdJLiRsqdvxySaFrrlVNIoqoxFkS7gEeY1CVZW5NPW
 dKvSdFS2olh6JDrkqrUSs+D+TzWYerBolc5vATaFRP+t2XzfYARtSPNZ0WwqTiPgjr73
 /G560U54hX+jrVncDmqqpnIprxWZCNldKNKMqlTVqVYWPgtNcuWct4uCzmzRYEIXs/do
 5QiHy8w7BDfugRVQGCdDgWQ3G3d0mUihxk5h75hDCAsqe5qCubxKzrLwXe+7UnQsV1wc
 MqzoB0h1FQWbh4srRw2cHuAysJ6qBT2MvjuHPzKcpWo4EBqYz8wgl+YZ6juXInPMl+we
 LF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tPJS32njs1p0TAmh/zajoLaecsftajZZsMooXqDnxZ8=;
 b=Z5QpdNTAUG/7YDcU/X9Sr0ttADE/nssGMx6EQypC1sA82lnU0+Jon0HmyWFr+zZjZ3
 +5emPP1jopONRu/OxUmAcnJXNEPOJE12pkCbItRUPIhb3FtirzRMn539ZFdZNruh0azZ
 2aTzDPnIekZqqWvXJet5iz1Fis2I1UllEZdRiGVfwy7u840c6LmgerwLuOITMDzatP5/
 EgEOIawlalsg1QD0Mi4AUp927evr7y1XMhrrGjktHDRHrkpnXzSmCjdFu/dBfdjgQwaJ
 9J3DNlXT7nXvxi9+asA8tpvkdU9RZWf+H9YlB7CfDoviXN/EcVr6usyqQgCXAD6Q8EZM
 IYcw==
X-Gm-Message-State: AOAM5335x5XzzyzW7EyNDnOb8vMmVXgYflPOKZI5BHOQw06ENBocL4mc
 b33opRTgiowuIwrMEYg/KZSWELx6no/uylAMSK4=
X-Google-Smtp-Source: ABdhPJzhyFfV6baymzlTtIi0lG3ZnAxFP3FNVjF2eV0l5gfNgSzGcCqFuB/b1sTolXNiK29unAvbWsGI/t9DG0Qo2uM=
X-Received: by 2002:a25:354:: with SMTP id 81mr17788614ybd.292.1600069993241; 
 Mon, 14 Sep 2020 00:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
 <20200909131327.GA3241@yuki.lan> <20200909132703.GB3241@yuki.lan>
 <CAEemH2e+Ck8M22gdgL0OQ24ekBPyDu4FwGrdG+da9E62UZWjRQ@mail.gmail.com>
 <CAEemH2eJCUuf=SQF_GdQ7U9q_8+BD9LsxPAgwuJS9wx8zBzNww@mail.gmail.com>
In-Reply-To: <CAEemH2eJCUuf=SQF_GdQ7U9q_8+BD9LsxPAgwuJS9wx8zBzNww@mail.gmail.com>
From: Cixi Geng <gengcixi@gmail.com>
Date: Mon, 14 Sep 2020 15:52:37 +0800
Message-ID: <CAF12kFs+Wzm2rt5uE7WoHDXZSpdtZaZPgspKTACpYnw7zR+sgA@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "Pravin Raghul S." <pravinraghul@zilogic.com>, xingfeng.kang@unisoc.com,
 "Vijay Kumar B." <vijaykumar@zilogic.com>, Orson Zhai <orsonzhai@gmail.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWw6CkNhbiB3ZSBtZXJnZSB0aGUgdWFydCBkZXZpY2UgZHJpdmVyIHRlc3RjYXNlIGFu
ZCB0aGUgZGV2aWNlLWRpc2NvdmVyIGZyYW1ld29yayDvvJ8KU28gdGhhdCB3ZSBjYW4gY29udGlu
dWUgd3JpdGUgb3RoZXIgZGV2aWNlIGRyaXZlciBjYXNlIGluIExUUC4KSSBhbSBsb29raW5nIGZv
cndhcmQgY29udHJpYnV0ZSB0byBsdHAgb24gdGhlIGRyaXZlciB0ZXN0IC4KCmh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAvbGlzdC8/c2VyaWVzPTE4NTI0MApodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL2xpc3QvP3Nlcmllcz0xOTUxNTEKCkxp
IFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPiDkuo4yMDIw5bm0OeaciDEw5pel5ZGo5ZubIOS4i+WN
iDU6MjPlhpnpgZPvvJoKPgo+Cj4KPiBPbiBUaHUsIFNlcCAxMCwgMjAyMCBhdCAzOjE5IFBNIExp
IFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gV2VkLCBTZXAg
OSwgMjAyMCBhdCA5OjI2IFBNIEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6PiB3cm90ZToK
Pj4+Cj4+PiBIaSEKPj4+ID4gQWxzbyBJIHdvdWxkIGxpa2UgdG8gZ2V0IHJpZCBvZiB0aGUgLWZu
by1vcHRpbWl6ZS1zaWJsaW5nLWNhbGxzIGluIHRoZQo+Pj4gPiBNYWtlZmlsZSwgdGhpcyBtYWtl
cyB0aGUgdGVzdCBhIGJpdCBmcmFnaWxlIGFuZCBsZXNzIHBvcnRhYmxlLgo+Pgo+Pgo+PiBJJ20g
bm90IHZlcnkgc3VyZSwgbGV0IG1lIHRoaW5rL2NoZWNrIGEgd2hpbGUuCj4KPgo+IEZyb20gdGhl
IGRvY3VtZW50LCBpdCBjb3VsZCBhbHNvIGhlbHAgcHJldmVudHMgb3B0aW1pemF0aW9uIHB1cnBv
c2VzLgo+IEkgdGhpbmsgd2UgY2FuIGhhdmUgYSB0cnksIGlmIG5vIG1vcmUgaXNzdWVzLCB0aGF0
IHdpbGwgYmUgZ3JlYXQuCj4KPj4KPj4KPj4+Cj4+PiAvKgo+Pj4gICogUmV0dXJucyBuZWdhdGl2
ZSBudW1iZXIgaWYgc3RhY2sgZ3Jvd3MgZG93biwgcG9zc2l0aXZlIGlmIHN0YWNrIGdyb3dzIHVw
Cj4+PiAgKi8KPj4+IHN0YXRpYyBpbnQgc3RhY2tfZGlyKHZvaWQpCj4+PiB7Cj4+PiAgICAgICAg
IGludHB0cl90IGFkZHIgPSBhZGRyX2Z1bmMoKTsKPj4+Cj4+PiAgICAgICAgIHByaW50ZigiJXAg
JXBcbiIsICZhZGRyLCAodm9pZCopYWRkcik7Cj4+Cj4+Cj4+IFRoaXMgbWV0aG9kIG1heSBiZSBk
b2FibGUsIGJ1dCB0aGUgc2Vjb25kICVwIHByaW50IChuaWwpLCBJIGRvbid0IHdoeS4KPgo+Cj4g
VGhlIHJlYXNvbiBzZWVtcyB0aGF0IHRoZSBsb2NhbCB2YXJpYWJsZSBpcyByZXZva2VkIGFmdGVy
IHRoZSBmdW5jdGlvbgo+IGlzIGNhbGxpbmcsIHNvIHdlIGdldCBOVUxMIG9mIHRoZSBsb2NhbCB2
YXJpYWJsZSBhZGRyZXNzLiBJdCB3b3JrcyBhcyB3ZQo+IGV4cGVjdGVkIHdoZW4gaW50cm9kdWNp
bmcgYSBnbG9iYWwgcG9pbnRlciB0byBzYXZlIGFuZCByZXR1cm4gdGhlICcmYScuCj4KPiAtLQo+
IFJlZ2FyZHMsCj4gTGkgV2FuZwo+Cj4gLS0KPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
