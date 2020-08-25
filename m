Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF4250E61
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 03:54:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1FB83C2F3B
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 03:54:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 303CE3C1CDD
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 03:54:10 +0200 (CEST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5694010006CC
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 03:54:10 +0200 (CEST)
Received: by mail-yb1-f178.google.com with SMTP id e187so6276910ybc.5
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 18:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gb6trp7STM65xaFroKPSmYAAG28ZdlrZYk7NONEZ0+k=;
 b=kHivlQ52AgxYw/VPFXIaKkRlME3GF5kAKs54SD6Rrg5EuGjeRYeAMeeVtsTHdWzEau
 pouPpG3Jq8yh9QFz2ApFQsgr5ECrj6urcSNT8DT8LkXtQ7wzNR0XfL7+KUXBkiCh4C76
 RijRF6v6NauFfbcRuPxSNFedHEkG7rqUOOLCFTv7WY2msbd83mQWv6uMU+jPc27dPG9r
 W2XXbgVLHds1+1J2j5Ix4UrZejWS9d4usxIBv4PCsBy05+A/SFM9k6u4yDhIi0khu+yW
 nxBliSlB954HDQO9zzgh6tCGjZaVcxGsUQpTlIFEvMoloQbMKdpEGkpc9TFQJTSWgT3v
 coSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gb6trp7STM65xaFroKPSmYAAG28ZdlrZYk7NONEZ0+k=;
 b=KxhL/ipjf1d03h62pwUlqugbWSYovfo+jRlVWUmLgcYdtdADTCF3l/apfNI5wS2Q7H
 MwDK0JO4PUMF0ujrO7iwy4o68fA530ng0UNqHF56sDpSHupKLlrFSj7djN9l2C5Ah9K6
 sx5C8FCK6iNsTZKNCf+wIVBRKVqs1AfCHptmdWpYZX+QMiFZuS5Z5oDgWF45JXc4uy6g
 b2c5zpI7Y9lIQzwQQBEZEjlBlv0ajUXtRH9o0gQ52VkvxODJ9A7Qs64841Sy5jrOE69G
 skYNU+YXpE2zeb/TU+TOHCF2KErrPkXiU+qr7TiISQb8WUBg8Cd8i9ddLeHQphjdVEo/
 bZOw==
X-Gm-Message-State: AOAM531yR+/NLF7EZsGHW1n2gnCRI5+hlfjjN9QH8szkt/+LmQMSlgc7
 k9Uin0Wwjrok5LFuW03aybCesoCCWvj2a4deRXI=
X-Google-Smtp-Source: ABdhPJxS7nMW8LB+Yfru/yCbuAbKQ8CnCQA1yBXVrUnEMJw2666p6FGz053MepkPAlq6n94lyOmybsUnw2ywDv2R5xs=
X-Received: by 2002:a25:40cb:: with SMTP id
 n194mr11050798yba.380.1598320389287; 
 Mon, 24 Aug 2020 18:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
In-Reply-To: <20200824074226.GB2466@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Tue, 25 Aug 2020 09:52:33 +0800
Message-ID: <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
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
Cc: ltp@lists.linux.it, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmtzIGZvciB5b3UgZXhwZXJpZW5jZXMgb24gdGhlIHJlYm9vdO+8jApTbyBmYXIgbXkgb3Bp
bmlvbiBpcyBhZGQgYSByZWJvb3Qgc2VydmljZSBieSBjaGtjb25maWcgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KdGhlIHNlcnZpY2Ugd2lsbCBzdGFydCBydW5sdHAgc2NyaXB0cyBmcm9tIGxhc3Qg
YnJlYWsgb2ZmIHBvaW50Lgp3aGVuIHRoZSB0c3RfdGVzdCBoYXZlIC50c3RfbmVlZHNfcmVib290
ID0xIGZsYWcsIGl0IHdpbCBzdHJvcmUgdGhlCnJ1biBzdGF0dXMgYW5kCnJlYm9vdCB0aGUgbWFj
aGluZSBiZWZvcmUgcnVuIHRoZSB0ZXN0IGNhc2UuCk5vdyBJIHdhbnQgdG8ga25vdyB3aGF0IG5l
ZWRzIHRvIGJlIHByZXNlcnZlZO+8nwoKQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+IOS6
jjIwMjDlubQ45pyIMjTml6XlkajkuIAg5LiL5Y2IMzo0MeWGmemBk++8mgo+Cj4gSGkhCj4gPiBJ
IHdhbnQgdG8gYWRkIGEgcmVib290IGZ1bmN0aW9uIGluIExUUCBmb3IgbXkgdGVhbSB3cml0ZSBh
IG1lbW9yeSBwYWdlCj4gPiByZWxhdGVkIGNhc2U/Pz8KPiA+IGFuZCBuZWVkIHJlYm9vdCB0byBt
YWtlIHRoZSBtZW1vcnkgY2FjaGUgb3Igc29tZSBsaWtlbHkgaXQgcHVyZSBjbGVhci4KPiA+Cj4g
PiBTbyBJIHdhbnQgdG8gYWRkIGEgdHN0X25lZWRzX3JlYm9vdC4gd2hlbiBpdCB3YXMgc2V0LCBy
ZWJvb3QgdGhlCj4gPiBtYWNoaW5lIGFuZCBjb250aW51ZSBydW4gdGVzdCBmcm9tIHRoZSBwb2lu
dCBiZWZvcmUuCj4gPgo+ID4gSSB0aGluayAgdGhpcyByZXF1aXJlbWVudCBpcyBtZWFuaW5nZnVs
Pz8/IFNvIGNhbiB5b3UgZ2l2ZSBtZSBzb21lIGFkdmlzZT8KPgo+IFllcyBpdCBpcywgYWN0dWFs
bHkgeW91IGFyZSBub3QgdGhlIG9ubHkgb25lIHdobyBuZWVkcyB0aGF0LiBUaGVyZSBhcmUKPiBw
bGVudHkgb2Ygb3RoZXIgdGVzdGNhc2VzIHRoYXQgd2lsbCBoYXZlIHRvIHJlYm9vdCB0aGUgbWFj
aGluZSwgZm9yCj4gZXhhbXBsZSB0aGUga2V4ZWMoKSBzeXNjYWxsIHRlc3RzLCBNQ0UgaW5qZWN0
aW9uIHRlc3RzLCBldGMuCj4KPiBXaGF0IEkgd2FudGVkIHRvIGFkZCBpcyBhIGJpdCBzaW1pbGFy
IHRvIHlvdXIgcHJvcG9zYWwuCj4KPiBJIHdhbnRlZCB0byBhZGQgcmVib290c19tYWNoaW5lIGZs
YWcgdG8gdGhlIHRzdF90ZXN0IHN0cnVjdHVyZSwgd2hpY2gKPiB3aWxsIGluZm9ybSB0aGUgdGVz
dCBmcmFtZXdvcmsgdGhhdCB0aGUgdGVzdCB3aWxsIHJlYm9vdCB0aGUgbWFjaGluZSBpbgo+IHRo
ZSBtaWRkbGUgb2YgdGhlIHRlc3QuCj4KPiAqIFRoZSBmcmFtZXdvcmsgd2lsbCBoYXZlIHRvIGlu
ZXZpdGFibHkgcnVuIG9uIGEgZGlmZmVyZW4gbWFjaGluZSwgYnV0IHRoZQo+ICAgcnVubHRwLW5n
IGFscmVhZHkgZG9lcyB0aGF0Lgo+Cj4gKiBUaGUgZnJhbWV3b3JrIHdpbGwgcmVjb25uZWN0IHRv
IHRoZSBtYWNoaW5lIGFmdGVyIGEgcmVib290IGFuZAo+ICAgcmUtZXhlY3V0ZSB0aGUgdGVzdCB3
aXRoIGEgZmxhZyB0aGF0IHdvdWxkIHNheSB0aGF0IHRoaXMgaXMgYSBzZWNvbmQKPiAgIHN0YWdl
IG9mIHRoZSB0ZXN0LCBpLmUuIGFmdGVyIHJlYm9vdC4KPgo+IC0tCj4gQ3lyaWwgSHJ1YmlzCj4g
Y2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
