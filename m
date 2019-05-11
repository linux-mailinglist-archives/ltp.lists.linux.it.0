Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A94E31A747
	for <lists+linux-ltp@lfdr.de>; Sat, 11 May 2019 11:31:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16A9D29879F
	for <lists+linux-ltp@lfdr.de>; Sat, 11 May 2019 11:31:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BA33729877F
 for <ltp@lists.linux.it>; Sat, 11 May 2019 11:31:05 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1C4936021D3
 for <ltp@lists.linux.it>; Sat, 11 May 2019 11:31:07 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id a130so6750310ywe.13
 for <ltp@lists.linux.it>; Sat, 11 May 2019 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHQJMGZleIGOA3/8OVMjl0i81klJ5FqXkm5mdCvfRMk=;
 b=niX8WuTYG4bvu4lecU5iz0882gioacD+4XINxnMwuPz1Do+BuILAcJIT43eIw3+ncT
 X5UQKhod9zo1i9H4f4i6BCX8Io4tbtrWsCmPcwl1lWka1nGgJXWya/v/kn46h7gilVzM
 VwoN9SbrkP5LxkgnyDgNcUTpX4hbf4unT99G373Lomt+PdPCbH0IzpHOgJ8WkPQsy4aN
 juH5u2w/53gHRtwdM/UEsRzfOCeOEJeKI+6E+yjzzQRNaTpEkrGx76nF251l7ZPMMtx8
 7L6C7eCAjPHAV89F8XM6fSfccAHK8ngBbXY/9vTmJQUzgGtykhM9o7wv42ZyfcO1Mjo0
 0IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHQJMGZleIGOA3/8OVMjl0i81klJ5FqXkm5mdCvfRMk=;
 b=gKnvvyKSWcHAmQGa5JG4A7Un+sPJhGY/w7g/LS0rHsJATUfjU8m0B46nQz7wk8Tidu
 Bi28jSVEDUSTWmaL9QWYfpd43wHMDAFzmXErI+gcMZ/8kLNI6gPsn3Q1cPK1dpDzZsJG
 eG+JlutKEl17xnD616hECSdsU6vK49nCRXlayBKe+YJmIa27G6j0ARDcWex0c4YOym2q
 xjuRSuCsbN21PeXpxQkB9O9uS7ntRl9ZfKkZ3A86TAhcsELyBXEeXMDykV37v2caUfPY
 e55YZGp0gsB0cNV7JcPdXx9To19M3IpNK0QGha0PcS02RXYOSQYi80voYL2kfjOGyakS
 Y3MA==
X-Gm-Message-State: APjAAAVYnCZg5O7340ElTsxjmNVZIr1Mf9ru+18dIEhsFi9erPriEQRP
 EzUkVze3aoXruIf5z4Lg8NP0ED6D3SLxXbzc7Fg=
X-Google-Smtp-Source: APXvYqyhcPFSgK2LlzHClXDuu9UGk0HaOsDqiMwvg6PkP2vHpONVlxW4GY5UOUoRGuV2yM/FIvviVHyXvC5mbdwB0Vs=
X-Received: by 2002:a5b:64a:: with SMTP id o10mr7965134ybq.32.1557567063454;
 Sat, 11 May 2019 02:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxjDyx7JFBSmkDe-rHNe=NriT710Ldsva=s+HasaDL0CTw@mail.gmail.com>
 <20190510044217.5215-1-xzhou@redhat.com>
 <CAOQ4uxi1=Xj59GvyrJf9HiMgGvRYTC8HGG8UOZKz3B8zgGh52g@mail.gmail.com>
 <20190510081535.ax7th47uyjjkayk6@XZHOUW.usersys.redhat.com>
 <CAOQ4uxjAzTL+aN4SdvD7xEUhuOht0nc70JDUOqAHGoyChOyPbA@mail.gmail.com>
 <20190511042014.xlonuwqpg6owg6a3@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190511042014.xlonuwqpg6owg6a3@XZHOUW.usersys.redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 11 May 2019 12:30:51 +0300
Message-ID: <CAOQ4uxjQ918iCXv3XdzmyKfQjqzBu-=N3Y+-BXDmrEDH-KVfpQ@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/swap{on,
 off}: fail softly if FIBMAP ioctl trial fails
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

T24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgNzoyMCBBTSBNdXJwaHkgWmhvdSA8eHpob3VAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAxMTo0ODo0MkFNICswMzAw
LCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDExOjE1
IEFNIE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
RnJpLCBNYXkgMTAsIDIwMTkgYXQgMDg6Mjc6MzVBTSArMDMwMCwgQW1pciBHb2xkc3RlaW4gd3Jv
dGU6Cj4gPiA+ID4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgNzo0MiBBTSBNdXJwaHkgWmhvdSA8
eHpob3VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQWRkIGEgdGVzdCBo
ZWxwZXIgdG8gZG8gYSBGSUJNQVAgaW9jdGwgdGVzdC4gUmVtb3ZlIG9sZCBmcyB0eXBlIHdoaXRl
bGlzdCBjb2RlLgo+ID4gPiA+Cj4gPiA+ID4gSWYgeW91IHdvdWxkbid0IGhhdmUganVzdCBkb25l
IHRoYXQgaXQgd291bGQgaGF2ZSBiZWVuIGdvb2QuCj4gPiA+ID4gQnV0IHlvdXIgcGF0Y2ggYWxz
byBjaGFuZ2VzIGEgbG90IG9mIHRoZSBsb2dpYyBhbmQgb3V0cHV0IG1lc3NhZ2VzLAo+ID4gPiA+
IHdoaWNoIGlzIGxlc3MgZ29vZC4KPiA+ID4KPiA+ID4gRmlyc3Qgb2YgYWxsLCBkb24ndCBiZSBt
YWQgaWYgeW91IHRoaW5rIEknbSBjaGFuZ2luZyB0b28gbXVjaC4gOikKPiA+Cj4gPiBOb3QgbWFk
LiBTb3JyeSBpZiBjYW1lIG9mZiB0aGlzIHdheS4uCj4gPiBKdXN0IHRyeWluZyB0byBleHBsYWlu
IHdoeSB0b28gbXVjaCBjaGFuZ2VzIGNhbiBiZSBjb3VudGVyIHByb2R1Y3RpdmUuCj4gPiBBbmQg
SSBhbSB3cml0aW5nIG15IG9waW5pb24sIHlvdSBhcmUgbm90IG9ibGlnZWQgdG8gYWdyZWUgd2l0
aCBpdCA7LSkKPgo+IFN0YXJ0IHlvdXIgZGV2ZWxvcGVyIGVuZ2luZS4gQWN0dWFsbHkgX3RoaW5r
XyBhYm91dCB3aGF0IHlvdXIncmUgd3JpdGluZy4KPiBZb3VyIG9waW5pb24gdmFyaWVzIGV2ZXJ5
IHNpbmdsZSBwb3N0IGluIHRoaXMgdGhyZWFkLgo+CgpJIHNlbnNlIHRoYXQgSSBvZmZlbmRlZCB5
b3UuIEkgZGlkIG5vdCBtZWFuIHRvLiBJIGFwb2xvZ2l6ZS4KVGhlcmUgbWlnaHQgaGF2ZSBiZWVu
IHNvbWUgbWlzY29tbXVuaWNhdGlvbi4KTXkgb3B0aW9uIHZhcmllZCBhZnRlciBpbmNvcnBvcmF0
aW5nIGZlZWRiYWNrIGZyb20gTGkgV2FuZyBhbmQgbG9va2luZwpjbG9zZXIgYXQgcmVjZW50IGtl
cm5lbCBjaGFuZ2VzIHRvIGJ0cmZzLCB3aGljaCBJIHdhcyBub3QgYXdhcmUgb2YuCgpUbyBiZSBj
bGVhciwgbXkgY3VycmVudCBvcGluaW9uIGlzOgotIEFzIExpIHN1Z2dlc3RlZCwgaXQgaXMgYmVz
dCB0byBjaGVjayBmaWxlc3lzdGVtIHN1cHBvcnQgaW4gc2V0dXAoKQp1c2luZyBzd2Fwb24oKQog
IGFuZCB0aGUgcmVzdCBvZiB0aGUgdGVzdCBzaG91bGQgbm90IHJlbGF4IGFueSBmYWlsdXJlCi0g
QnkgY2hlY2tpbmcgRklCTUFQIGJlZm9yZSBzd2Fwb24oKSBpbiBzZXR1cCgpIHlvdSBjYW4gZGlm
ZmVyZW50aWF0ZSBiZXR3ZWVuCiAgZmFpbGluZyB0aGUgdGVzdCAoZm9yIGxlZ2FjeSBmcykgb3Ig
VENPTkYgKEJUUkZTLCBORlMpCi0gVENPTkYgcmVzdWx0IHNob3VsZCBiZSBhY2NvbXBhbmllZCB3
aXRoICJub3Qgc3VwcG9ydGVkIiBsYW5ndWFnZQotIFRha2UgY2FyZSBub3QgdG8gY2hhbmdlIHRl
c3QgbG9naWMgaW4gYSB3YXkgdGhhdCB3aWxsIHJlZ3Jlc3MgdGVzdCBvbiBvbGRlcgogIGtlcm5l
bHMgb3Igc29tZSBmaWxlc3lzdGVtCgpbLi4uXQo+ID4gUHV0IHlvdXIgdGVzdGVyIGhhdCBvbi4g
SW1hZ2luZSB5b3UgZG8gbm90IGtub3cgd2hhdCBzd2FwZmlsZSBpcyBub3IKPiA+IHRoYXQgZmls
ZXN5c3RlbXMgbWF5IHN1cHBvcnQgaXQgb3Igbm90Lgo+ID4gV2hpY2ggaXMgdGhlIGZvbGxvd2lu
ZyBtZXNzYWdlcyBjb252ZXkgdGhlIHRlc3QgcmVzdWx0IGJldHRlcjoKPiA+Cj4gPiBUQ09ORjog
RmFpbGVkIHRvIG1ha2Ugc3dhcGZpbGUKPiA+Cj4gPiBPUgo+ID4KPiA+IFRDT05GOiBta3N3YXAg
bm90IHN1cHBvcnRlZCBvbiBidHJmcyBmaWxlc3lzdGVtCj4KPiBZb3UgYXJlIHJhbnRpbmcgYXQg
d3JvbmcgZ3V5LiBJdCB3YXMgbm90IG1lIHdyaXRpbmcgdGhpcyBtZXNzYWdlLgo+CgpDZXJ0YWlu
bHkuIEl0IHdhc24ndCBteSBpbnRlbnRpb24gdG8gYmxhbWUgeW91IGZvciBhbnl0aGluZy4KVGhl
IGRldmVsb3BlciB0aGF0IHdyb3RlIHRoaXMgbWVzc2FnZSBkaWQgbm90IGV4cGVjdCB0bXBmcyB0
byByZWFjaCB0aGlzCnBvaW50LCBiZWNhdXNlIGJsYWNrbGlzdCB3YXMgaW4gcGxhY2UuCkJ5IGNo
YW5naW5nIGZyb20gVEJST0sgdG8gVENPTkYsIHRoZSBtZXNzYWdlIG1heSBuZWVkIHRvIGNoYW5n
ZQpmcm9tIGEgbGFuZ3VhZ2Ugb2YgIkZhaWxlZCIgdG8gYSBsYW5ndWFnZSBvZiAibm90IHN1cHBv
cnRlZCIuCgo+ID4KPiA+IElmIHRlc3Qgc2V0dXAgYXJyaXZlcyB0byBhIGNvbmNsdXNpb24gdGhh
dCBmaWxlc3lzdGVtIGRvZXNuJ3Qgc3VwcG9ydCB0ZXN0Cj4gPiBhbmQgdGVzdCBzaG91bGQgYmUg
c2tpcHBlZCwgdGhhdCBpcyB3aGF0IHNob3VsZCBiZSBjb21tdW5pY2F0ZWQgdG8gdXNlci4KPiA+
Cj4gPiBUaGUgQlRSRlNfTUFHSUMgY29kZSB0aGF0IHlvdXIgcGF0Y2ggcmVtb3ZlcyBkb2VzIHRo
YXQgY29ycmVjdGx5Lgo+ID4gWW91ciBwYXRjaCBkb2VzIG5vdC4KPiA+Cj4gPiBFdmVuIHRoZSBt
ZXNzYWdlOgo+ID4gVENPTkY6ICJXaWxsIG5vdCByZXBvcnQgRkFJTCBhcyBGSUJNQVAgaW9jdGwg
bm90IHN1cHBvcnRlZCIKPiA+IGlzICJ0b28gbXVjaCBpbmZvcm1hdGlvbiIgSU1PLgo+ID4gVXNl
cnMgd2l0aG91dCBwcm9wZXIgYmFja2dyb3VuZCB3b24ndCBrbm93IHdoYXQgaXQgbWVhbnMuCj4g
PiBUaGlzIHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIgSU1POgo+ID4gVENPTkY6ICJGSUJNQVAgaW9j
dGwgbm90IHN1cHBvcnRlZCBvbiBYWFggZmlsZXN5c3RlbSIKPgo+IEkgZ3Vlc3MgTFRQIGlzIG5v
dCBhIGRlc2t0b3AgYXBwIDopLCBidXQgeWVzIHRoZXNlIG1lc3NhZ2VzIG5lZWQgaW1wcm92ZW1l
bnQuCj4KClRlc3QgZW5naW5lZXJzIGNhbiBzcGVuZCBhIGxvdCBvZiB0aW1lIGZpZ3VyaW5nIG91
dCB3aHkgYSBjZXJ0YWluIHRlc3QKKG9mIGEgZmVhdHVyZSB0aGV5CmFyZSBub3QgaW50aW1hdGVs
eSBmYW1pbGlhciB3aXRoKSBoYXMgc3RhcnRlZCBmYWlsaW5nIG9uIGEgY2VydGFpbgprZXJuZWwg
dmVyc2lvbiBvciBhZnRlcgpnZXR0aW5nIGxhdGVzdCBMVFAuCldlIHNob3VsZCBiZSBzeW1wYXRo
ZXRpYyB0byBvdXIgZW5kIHVzZXJzIGFuZCB0cnkgdG8gbWFrZSB0aGVpciBsaXZlcwplYXNpZXIg
aWYgaXQgaXMKaW4gb3VyIHBvd2VyLgoKVGhhbmtzLApBbWlyLgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
