Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802635636
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:27:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13EF73EA645
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:27:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7DCBC3EA5FE
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:27:48 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C26411400DE6
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:27:47 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id s24so9122109plr.8
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 22:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DL46jIrkC6tGhfIvHyUAHTeBiEF9aO5WzlqcgLG2vho=;
 b=YgLlRwyDJz3m5a7u8XYupW//gidCDlATPr0Rz4n4ZJlxlBlbmBm+pQg94oiV0paGml
 WjjUD7+gt834wBt3Cr2EaWoZAmVKzFe6utX76FMj8Kh1hbFRWM7U+My32xreTW2o7JXj
 fYVO+nQ5aKG8I0yDUASyI5IO89f3yMdDP6BtT83YW4N8UDYb6QvjFGPofRpUOemAU+EW
 /awUH43jGo9+tOArd7yk7H5JWkKSMeGpAfHyTCSB7TEE/QM3hZcICjyfMVN/suTm1IWZ
 NdOeaw/CJYvaJKWNGRkVOIjo2+CMscS1iK4jdi50NuWv98ikYZm5vc27JFZhIJJn9mHS
 XOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DL46jIrkC6tGhfIvHyUAHTeBiEF9aO5WzlqcgLG2vho=;
 b=Q1AtUifuNgj5/EfB8myMrTFxQKA0HCKf/w+zxyL8dMKwhES92RB9piWOy4p1uHIjc7
 8/8y5teS2nmgpBed/RHr3hjWXhRgP/pAesagwPaSgnu73wo60fmRMqWEGtShwt/Qtyc/
 g+iE2PM+f2PPpVeqjJBZ7EiWFGQfNMJgY47kj7abEA6yYHvNiLogSGCE7rjfRMCSCncv
 c3e5TQMsmcfNRWT9ZUL5o25/Idgp0+XkBj9pDn55GUfyXYwm3E3+xFL4kFzRXYQyS7Lc
 N8ZlOQLSSX2K+nv7I9de7X4RV1eCuB/uwD6mTtLNw24ZqsQT6Zz+jLNT0nex6ov+u+Fm
 +RfA==
X-Gm-Message-State: APjAAAXalp0l4uqyAPHLYFg2Zx4WRFru8AGFyMRrNNZiaOxykAPEtuWI
 4JO7aCMEXeqqrVmA7f8YsQc=
X-Google-Smtp-Source: APXvYqzlYIN6zcIqpXMmXvNqxIcJqfn7ieu1yFlRW65W3fX3Axlrj/WyPCZQwryNL8Dw1L/ZDhUWFg==
X-Received: by 2002:a17:902:9b81:: with SMTP id
 y1mr15320866plp.194.1559712466156; 
 Tue, 04 Jun 2019 22:27:46 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 124sm20963622pfe.124.2019.06.04.22.27.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 22:27:45 -0700 (PDT)
Date: Wed, 5 Jun 2019 13:27:38 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20190605052738.42xfbu6xjf5dqti2@XZHOUW.usersys.redhat.com>
References: <20190604082331.uunxtzshdgcnv4xg@XZHOUW.usersys.redhat.com>
 <20190605044215.19448-1-jencce.kernel@gmail.com>
 <5CF750DF.9040006@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF750DF.9040006@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/preadv2/preadv203: set mount_device
	flag
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

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDE6MTk6MjdQTSArMDgwMCwgWGlhbyBZYW5nIHdyb3Rl
Ogo+IE9uIDIwMTkvMDYvMDUgMTI6NDIsIE11cnBoeSBaaG91IHdyb3RlOgo+ID4gTm93IHRoZSB0
ZXN0cyBhcmUgcnVubmluZyBpbiBNT1VOVFBPSU5UIHdpdGhvdXQgaXQgbW91bnRlZC4KPiA+IEZh
aWxzIG9uIGV4dDI6Cj4gSGkgTXVycGh5LAo+IAo+IERpZCB5b3UgZ2V0IEVPUE5PVFNVUFAgd2hl
biBydW5uaW5nIHByZWFkdjIwMyBvbiBleHQyPwoKTm8sIGl0J3MgcnVubmluZyBvbiBuZnMgb3Ig
Y2lmcyBleGFjdGx5LgoKZXh0MiBpcyB0aGUgZmlyc3Qgb25lIGluIGFsbF9maWxlc3lzdGVtcyBs
aXN0Li4gTXkgY29tbWl0IG1zZyBoZXJlCmlzIGNvbmZ1c2luZy4gU2VuZGluZyB2My4KCj4gCj4g
SXQgc2VlbXMgT0sgdG8gcnVubmluZyBwcmVhZHYyMDMgb24gZXh0MiwgYXMgYmVsb3c6Cj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiB0
c3RfdGVzdC5jOjExNzI6IElORk86IFRlc3Rpbmcgb24gZXh0Mgo+IHRzdF9ta2ZzLmM6OTA6IElO
Rk86IEZvcm1hdHRpbmcgL2Rldi9sb29wMCB3aXRoIGV4dDIgb3B0cz0nJyBleHRyYSBvcHRzPScn
Cj4gbWtlMmZzIDEuNDQuMyAoMTAtSnVseS0yMDE4KQo+IHRzdF90ZXN0LmM6MTExMTogSU5GTzog
VGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKPiBwcmVhZHYyMDMuYzoxNDU6IElORk86IE51
bWJlciBvZiBmdWxsX3JlYWRzIDc1MTA0NCwgc2hvcnQgcmVhZHMgMTAsIHplcm8KPiBsZW4gcmVh
ZHMgMCwgRUFHQUlOKHMpIDY3MDIxCj4gcHJlYWR2MjAzLmM6MTgwOiBJTkZPOiBOdW1iZXIgb2Yg
d3JpdGVzIDEwODc1NjAKPiBwcmVhZHYyMDMuYzoxOTQ6IElORk86IENhY2hlIGRyb3BwZWQgMTQ5
IHRpbWVzCj4gcHJlYWR2MjAzLmM6MjIzOiBQQVNTOiBHb3Qgc29tZSBFQUdBSU4KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gQlRX
OiBJIGdvdCBFT1BOT1RTVVBQIHdoZW4gcnVubmluZyBwcmVhZHYyMDMgb24gdG1wZnMuIDotKQoK
WWEuIFRoYW5rcyBmb3IgdGhlIGluZm8hCgpNdXJwaHkKCj4gCj4gQmVzdCBSZWdhcmRzLAo+IFhp
YW8gWWFuZwo+ID4gICAgIHByZWFkdjIwMy5jIGRvZXMgbm90IHNldCBtb3VudF9kZXZpY2UsIHdo
aWNoIG1ha2VzIEJST0s6Cj4gPiAgICAgICBwcmVhZHYyMDMuYzoxMjI6IEJST0s6IHByZWFkdjIo
KSBmYWlsZWQ6IEVPUE5PVFNVUFAKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8
amVuY2NlLmtlcm5lbEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3ByZWFkdjIvcHJlYWR2MjAzLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9wcmVhZHYyL3ByZWFkdjIwMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYy
L3ByZWFkdjIwMy5jCj4gPiBpbmRleCA4MTBkMWU4ZGIuLmU0ZjY4YTUxYiAxMDA2NDQKPiA+IC0t
LSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2Mi9wcmVhZHYyMDMuYwo+ID4gKysr
IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5jCj4gPiBAQCAt
MjYxLDYgKzI2MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiA+ICAJLmNs
ZWFudXAgPSBjbGVhbnVwLAo+ID4gIAkudGVzdF9hbGwgPSB2ZXJpZnlfcHJlYWR2MiwKPiA+ICAJ
Lm1udHBvaW50ID0gTU5UUE9JTlQsCj4gPiArCS5tb3VudF9kZXZpY2UgPSAxLAo+ID4gIAkuYWxs
X2ZpbGVzeXN0ZW1zID0gMSwKPiA+ICAJLm5lZWRzX3RtcGRpciA9IDEsCj4gPiAgCS5uZWVkc19y
b290ID0gMSwKPiAKPiAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
