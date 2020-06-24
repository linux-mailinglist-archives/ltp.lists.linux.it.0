Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B350207087
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:58:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5DD83C58F5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:58:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D64A63C0639
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:58:35 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1D63B14017C4
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:58:35 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id j4so872902plk.3
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eO1KFyp7KCrQnweQLs6w+bp57xCdxIQzDVL8M9A4a6s=;
 b=g3S14h0/M9PwLyjkJ8Fnro7Ae+WXNVMURGhHJlnpThA5+q03nrB+z91L8rvyKCQSaC
 HtUWtfc9Kl+G1kfQ75X9JWdxUVvaYkyHk20hp+4sqLNfVE86NxFkYlC3i3rVZ9Pb6WuV
 rywNjBj5QuQ7zToEgWgBxery4S7XRxLw7aKcXQltsZ9/S41J4bNCPPJWmKJnNfde8q0s
 VJoEmfyxRJgXYmKOxztRc86cfBAWJIvy6W7g5+VyEcVqOa8VVlTwkvLsWwTjhoqPKHCQ
 FLHs5LitQqGBpZApknnknxoYjg8Gh/274oL0X+jyBp8HSDiyPuQcTFUmYjRmFER3fSoJ
 VYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eO1KFyp7KCrQnweQLs6w+bp57xCdxIQzDVL8M9A4a6s=;
 b=nWC1e198Y2v4iDyzPyhD/Qgdg7P+6Gu0mxRCzxAVqCkuqW1KMQfemCa/izPSEYkRoK
 BZnNo9lzPNyaBb5mTPrpfJ/uArpW5VYkEF5KKDgd4rCTnAu6U7Fl0xPwAzNItpCldF1T
 pOBmI3AlbUP3AJGY2p9qkOFAkyBkaS2t/qacmDGxtzVCsEnHFcXXP/PEROKhwKRtxRDf
 CVgp1sKik+Gm5fMAOG4DSuM/Rzqp07JW2i4rs6W/7wrVl5jgCQCali4KiO8T56cNtyMZ
 z2R6imOzOPhekT7ZDf4nD2JP8umbYc4uBkjAQQpH77sFP2OHp40p6LU0iH9uj8NjY5fl
 RnDg==
X-Gm-Message-State: AOAM5303C2PAi7k1V+zUuu95MP8BaQn6NaJ1F5MzhT0ETDpVbMi/Wj1r
 XBjBYlNqQynqDyjStEs0DoSajPhnEj0KpVEkZR0=
X-Google-Smtp-Source: ABdhPJznDJvHSlL+3Jc6kdS0l1WulFk/vbY6oJ0flXNvcok39K+j+7SwEUqHlOTbu8Z4qRc2P8w/WUHVIG+X95jVWeA=
X-Received: by 2002:a17:902:8607:: with SMTP id
 f7mr26334248plo.9.1592992713344; 
 Wed, 24 Jun 2020 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
 <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
 <20200624090523.GA29350@yuki.lan>
 <adafab63-4390-a4a3-b3aa-923b31d5ac37@xilinx.com>
 <20200624092940.GA30917@yuki.lan>
In-Reply-To: <20200624092940.GA30917@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 24 Jun 2020 17:57:57 +0800
Message-ID: <CAF12kFvBj+9AF5AoJK=Varb0ZVGCNqW++8cS=j4BQRGxdQY=gw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Orson Zhai <orsonzhai@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/2] tst_test: Add support for
 device discovery
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
Cc: automated-testing@yoctoproject.org, Carlos Hernandez <ceh@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

YWRkIE9yc29uIGluIG1haWwgbG9vcAoKSGkgQ3lyaWwKaW4gdGhlIGx0cC1kZHQgdGVzdCBzY3Jp
cHQgLGl0ICBjYW4gYXV0byBkZXRlY3Qgd2hpY2ggc2VyaWFsIGRldmljZXMgYXJlIG9uCnRoZSBt
YWNoaW5lLCBhbmQgZmlsdGVyIG91dCB0aGUgc2VyaWFsIHBvcnRzIGluIHVzZWTvvIxTbyBJIGFt
IG1vcmUKY29uY2VybmVkIGFib3V0IHdoZXRoZXIgaXQgY2FuIGhhdmUgdGhpcyBmdW5jdGlvbiBp
biAgdGhlIGRldmljZS1kaXNjb3Zlcnkuc2gKCkN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6
PiDkuo4yMDIw5bm0NuaciDI05pel5ZGo5LiJIOS4i+WNiDU6MjnlhpnpgZPvvJoKPgo+IEhpIQo+
ID4gPj4gTm90IGV4YWN0bHkgc3VyZSBob3cgTFRQIGhhbmRsZXMgdGhpcyBpbiBnZW5lcmFsIGJ1
dCBJIHRoaW5rIGl0IG1ha2VzCj4gPiA+PiBzZW5zZSB0byBleHRlbmQgeW91ciB0ZXN0ICh0eHRf
dGVzdCkgcGFyYW1ldGVycyB0byBwYXNzIFRYL1JYIGNoYW5uZWwKPiA+ID4+IHZpYSBwYXJhbWV0
ZXJzIGRpcmVjdGx5IHRvIHRlc3QuCj4gPiA+Pgo+ID4gPj4gU29tZXRoaW5nIGxpa2UgdGhpcwo+
ID4gPj4gdWFydDAxXzExNTIwMCB1YXJ0MDEgLWIgMTE1MjAwIC10IC9kZXYvdHR5WFgwIC1yIC9k
ZXYvdHR5WFgxCj4gPiA+Cj4gPiA+IFlvdSBjYW4gcGFzcyB0aGVtIGluIGFuIGVudmlyb25tZW50
IHZhcmlhYmxlcy4gSWYgVUFSVF9UWCBhbmQgVUFSVF9SWAo+ID4gPiBhcmUgc2V0IHRoZSBkZXZp
Y2UgZGlzY292ZXJ5IGlzIG5vdCBhdHRlbXB0ZWQgYXQgYWxsIGFuZCB0aGUgdGVzdCBqdXN0Cj4g
PiA+IHVzZXMgdGhlc2UuCj4gPiA+Cj4gPiA+IElmIHRoZXkgYXJlIG5vdCB0aGUgc2NyaXB0IGlz
IGV4ZWN1dGVkIGFuZCB0aGUgdGVzdCBsb29wcyBvdmVyIHRoZQo+ID4gPiByZXN1bHQocykuIEl0
IHdvdWxkIGJlIG1vcmUgY29tcGxpY2F0ZWQgaWYgdGhlIGRldmljZXMgd2VyZSBwYXNzZWQgb3Zl
cgo+ID4gPiBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyBzaW5jZSB3ZSB3b3VsZCBoYXZlIHRvIHJl
LWV4ZWN1dGUgdGhlIGJpbmFyeS4KPiA+Cj4gPiBJIGRpZG4ndCBydW4gTFRQIGZvciBxdWl0ZSBh
IGxvbmcgdGltZSBteXNlbGYgYnV0IG9uIHhpbGlueCBkZXZpY2VzIHlvdQo+ID4gaGF2ZSAzIGRp
ZmZlcmVudCB1YXJ0IGluc3RhbmNlcyB3aGljaCB5b3UgY2FuIHdpcmU6IGNhZGVuY2UgdWFydCAo
b3IKPiA+IHBsMDExKSwgbnMxNjU1MCBhbmQgdWFydGxpdGUuCj4gPiBUaGF0IG1lYW5zIHdpdGgg
dGhlIHNhbWUgaHcgZGVzaWduIHlvdSBzaG91bGQgYmUgYWJsZSB0byB0byB0ZXN0Cj4gPiBjYWRl
bmNlPD0+bnMxNjU1MCBhbmQgbnMxNjU1MDw9PnVhcnRsaXRlLiBJdCBtZWFucyB5b3UgbmVlZCB0
byBleGNoYW5nZQo+ID4gdmFyaWFibGVzIGluIHRoZSBtaWRkbGUgb2YgdGVzdGluZy4KPgo+IFRo
ZSB3aG9sZSBwb2ludCBvZiB0aGUgc2NyaXB0IGlzIHRoYXQgaXQgcmV0dXJucyBvbmUgY29uZmln
dXJhdGlvbiBwZXIKPiBsaW5lIGFuZCB0aGUgdGVzdCB0aGVuIGxvb3BzIG92ZXIgdGhlc2UsIHdo
aWNoIGlzIGEgYml0IG1vcmUgZmxleGlibGUKPiB0aGFuIHJ1bnRlc3QgZmlsZXMuCj4KPiA+IE5v
dCBzdXJlIGlmIHRoaXMgaXMgc3VwcG9ydGVkIGJ1dCBJIHdvdWxkIHNpbXBseSBnZW5lcmF0ZSBy
dW50ZXN0Cj4gPiBkZXNjcmlwdGlvbiBiYXNlZCBvbiBpbmZvcm1hdGlvbiBJIGdvdCBmcm9tIGRl
dmljZSBkaXNjb3ZlcnkuCj4gPiBCdXQgSSBhbSBmYXIgZnJvbSB0ZXN0aW5nIGF0IHRoaXMgc3Rh
Z2UuCj4KPiBUaGUgZGlyZWN0aW9uIEkgd291bGQgbGlrZSB0byB0YWtlIGluIHRoZSBsb25nIHRl
cm0gaXMgdG8gc2xvd2x5IGdldCByaWQKPiBvZiBydW50ZXN0IGZpbGVzIGFuZCByZXBsYWNlIHRo
ZW0gd2l0aCBkYXRhYmFzZSB0aGF0IHdvdWxkIGJlIHVzZWQgYnkKPiB0aGUgdGVzdCBleGVjdXRp
b24gZnJhbWV3b3JrIHRvIGV4ZWN1dGUgdGVzdHMuIFRoZXJlIGFyZSB0b28gbWFueQo+IGxpbWl0
YXRpb25zIHRoYXQgYXJlIGltcG9zZWQgYnkgcnVudGVzdCBmaWxlcywgd2hpY2ggaW4gdGhlIGVu
ZCBzaGFwZQo+IHRoZSB3YXlzIHdlIHRoaW5rIGFib3V0IHRlc3RzLiBXZSBzaG91bGQgaGF2ZSBn
ZXQgcmlkIG9mIHRoZXNlIGxvbmcgdGltZQo+IGFnby4uLgo+Cj4gLS0KPiBDeXJpbCBIcnViaXMK
PiBjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
