Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D535DF320
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:37:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97C713EACAB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 11:37:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C21A93EAC9C
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:37:49 +0200 (CEST)
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 28E846019F5
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 11:37:49 +0200 (CEST)
Received: by mail-yw1-xc44.google.com with SMTP id j4so5374316ywk.11
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t97kLHopVU+DhzkI28LXex4CicmyChAgJWDsE9RB3Gc=;
 b=Ga5eZAAGaHaxURm9Nortiw6zc7lKknAV9WcFpn6nDRn7YPz8PPZju1hgBYw5D/4iwU
 dcgj4GptUVPgdzl/A0C8RFtj8lcKipO8W7w9bZeW25pS39qVWIKL+y3JAVCWzau8irMP
 0BlNUSub4vPZMwSkhnjUizFwe3RANYbf01slVzd3TYVNUcQFuF0/ExY9As/WK1nRA6Rq
 uMcwz05lLzZzFs9aPR6EG+/CCWk7C7PQ3M8oQfOxFJ8b+ZvaByZpDHNgdIbbHKfMuAaB
 pxH+xN+yzZuWImSknmx2X6Z54s9e+Kq2a10LtrcwntRgYNLjLaiBZ2zZe7O+cSIf1i2s
 yBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t97kLHopVU+DhzkI28LXex4CicmyChAgJWDsE9RB3Gc=;
 b=VMwAq1uVCD52UNyoLpd2BDcS/btkMXPqpl8HBLCYaZXsOy93ak2k7UFncvn8fshpR5
 z94JO01FcwAYDhVnKFi61AL+QJsYKbLVxzzw7Tp/OyIl6dlm+hsKLlJKYSLeziOZDFYS
 ULSKF0YI0AZq3z0YXv8NLU/D6c4wPl0YrE5WgGXLvXomPOHxzdjVMQveBy0xVxR6TVR5
 KVnfjrvsk+NVZ5I8nP9RNVRT5r07ByB5qAJJPtM/2nxfHDD1AT7nC1cFhl1NhLAxsnCO
 4ZsruhBLsTAnWrutGNPpJsEpW/h5Stl/pexgKdfewDG4WpNVfQpah785lgG80vwRmtQ2
 RQrg==
X-Gm-Message-State: APjAAAUtV2eTBUuuVimQq/Tu5lSoJdAVjmXGrHuKNOz4o3nTT/aOayij
 v0dtjyMwRyFPB2UjcRRPh8tyymXfgiPPrmPoj94=
X-Google-Smtp-Source: APXvYqz2l63N8YtA4gou8DzqI73Iqp3VRfeXxhvZ4F7g7fg/qG43PCRdyYCGdHuYKPbfgtsLBgnfM15Hc1CQ6+S+RPE=
X-Received: by 2002:a25:b883:: with SMTP id w3mr12089557ybj.337.1556617067730; 
 Tue, 30 Apr 2019 02:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190430071446.13716-1-xzhou@redhat.com>
 <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
 <20190430083056.b6q2p6yzqbp2q6fm@XZHOUW.usersys.redhat.com>
 <CAEemH2d-xLCFayr8uCycdYZCtwg1YRHJcpXjdzRCi6zJ6_rMPw@mail.gmail.com>
 <20190430090846.s2ctvbipxgs6nprr@XZHOUW.usersys.redhat.com>
 <CAEemH2dvDqWq7XMS_dNkuKkE31FejY59H+cvX37R8xCeo0uD3Q@mail.gmail.com>
In-Reply-To: <CAEemH2dvDqWq7XMS_dNkuKkE31FejY59H+cvX37R8xCeo0uD3Q@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 30 Apr 2019 05:37:36 -0400
Message-ID: <CAOQ4uxjD-YmwOt6v9s1MoXBCk2cdPrseLgDkHAaSWiVYH9SwDw@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgNToyMSBBTSBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4KPgo+Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgNTowOCBQTSBNdXJwaHkg
WmhvdSA8eHpob3VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Cj4+IC4uLgo+PiA+ID4gPiA+ICsgICAg
ICAgaWYgKGZzX3R5cGUgPT0gVFNUX09WRVJMQVlGU19NQUdJQyAmJiBlcnJubyA9PSBFSU5WQUwp
IHsKPj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdHN0X3Jlc20oVENPTkYsICJTd2FwZmlsZSBv
biBvdmVybGF5ZnMgbm90Cj4+ID4gPiBpbXBsZW1ldGVkIik7Cj4+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+PiA+ID4gPiA+ICsgICAgICAgfQo+PiA+ID4gPiA+Cj4+
ID4gPiA+Cj4+ID4gPiA+IFRoZSBjb2RlIGxvb2tzIGNvcnJlY3QuCj4+ID4gPiA+Cj4+ID4gPiA+
IEJ1dCBpdCBhbHJlYWR5IGhhcyBhIHRlc3Qgc2tpcHBpbmcgZm9yIEJUUkZTLCBpcyB0aGVyZSBh
bnkgcG9zc2liaWxpdHkgdG8KPj4gPiA+ID4gY29tYmluZSB0aGVzZSBmaWxlc3lzdGVtcyBjaGVj
ayB0b2dldGhlcj8KPj4gPiA+Cj4+ID4gPiBHb29kIGlkZWF+ICBTZW5kaW5nIFYyLgo+PiA+ID4K
Pj4gPgo+PiA+IE9uZSBtb3JlIGNvbW1lbnQuCj4+ID4KPj4gPiBJIGp1c3Qgbm90aWNlZCB0aGF0
IGl0IGFsc28gaGFzIGFuIEZTIHNraXBwaW5nIGxpc3QgaW4gc2V0dXAoKSwgZG8gdSB0aGluawo+
PiA+IGNhbiB3ZSBtb3ZlIEJUUkZTIGFuZCBPVkVSTEFZRlMgdG8gdGhlcmU/Cj4+Cj4+IEdyZWF0
ISBUaGF0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UuIEFsc28gSSdtIHRoaW5raW5nIGEgZmV3IG90aGVy
IHR3ZWFrcwo+PiBuZWVkZWQ6Cj4+Cj4+ICAgTkZTIG5vdyBhY3R1YWxseSBzdXBwb3J0IHN3YXBm
aWxlcy4gTGV0J3MgcmVtb3ZlIGl0IGZyb20gc2tpcCBsaXN0Owo+Cj4KPiBCdXQgQUZBSUsgc29t
ZW9uZSBzdGlsbCBydW4gTFRQIG9uIG9sZCBkaXN0cm8va2VybmVsLCBzbyB3ZSBjYW4ndCBndWFy
YW50ZWUgdGhlIHRlc3Qgd29ya3MgZmluZSBpbiB0aGF0IHNpdHVhdGlvbi4gU28sIG15IG9waW5p
b24gaXMgdG8gcmVzZXJ2ZSB0aGUgTkZTLCBvciBkbyB5b3UgaGF2ZSBhIGJldHRlciB3YXkgdG8g
bWFrZSB0ZXN0IG1vcmUgZmxleGlibGU/CgpBdm9pZCB3aGl0ZWxpc3QuClRlc3QgZm9yIEZJQk1B
UCBpb2N0bCBzdXBwb3J0LgoKVGhhbmtzLApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
