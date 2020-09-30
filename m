Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8927DE0B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 03:56:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CF233C2AB2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 03:56:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 08E203C2824
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 03:56:25 +0200 (CEST)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 077B26009AD
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 03:56:25 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id k18so29623ybh.1
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U9AXCDjwoqzdVDQH10SSy1alt8N9dDOsF4bCqwP425c=;
 b=AiG3PTqtYv7nrzFw4I46Qv8n+TdbGwRu6Yds7PGzoiMnNNNppNgkJi79n1LujM+S2s
 Ap8e3A7lbZK/019WUcU5u7L8Jjo0XCVwEQTc9QfXemubept+D+djN+OIE1gVgrW4RSOl
 s6pl8HX7iKCKVR5Ru8oCjVQ6wwNtRdr80zNNi3uC0J64N3auQhygjhmxjY1I5/YadJKX
 pTjyA9QTJzxPgmq/CxMHMCRSztQ7pZyenN8WNl8SiEwyPO3bDOga/elC++/axsUKr8kE
 Ob1B+23OcxIzvkNESUd+oP5n0IQEqpMA9xacmod1WljteejN/CK1zT0huqmc3Rcv3Iq+
 ay2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U9AXCDjwoqzdVDQH10SSy1alt8N9dDOsF4bCqwP425c=;
 b=k28DRNJt5ZlgayGoLZ6ulCXGVetpC6to6P1Mnhf5HtBxX5Jkk2yuYc7dZEv4LxU8DQ
 VXX8M0clXy+pjdoP3rYP6dNR1KsXfetmX+WJUh5y9Cx6fsxAHKBYZGB4l8rFUFZVTlDJ
 Fp8S6vdP+QFEdBTR6CeL12rAJH+YchvjEXiFhTe+n2l754bc3mDMbK4qjvZuKmyo9g96
 gh1JZ7KfoBxS6Y8A0wY+jGQPaNDJAaPPll8kaWoNIdg+pHgNvltu6reZw7paJ8lP3gyP
 lByDVCVD3fwaSJze97yiUb2FsD4kJJbqU9WVBOSa3Oa/vvJBoUPaAduKyhwHffYFYWld
 b6PQ==
X-Gm-Message-State: AOAM531BfkW4MX15PhxgWE5pV8nalKRR1P+iL+dKb0f5H7RwPen3+plz
 5fvx1QliRN3ycvQkOE6Zs94tAOysCtvv5QIJtOc=
X-Google-Smtp-Source: ABdhPJyy1b9WlvckB3R35qarsxUmfUYZC6tj3oS/J8C6jbKB4KyP/sE1Gukm50uCsB0/v+ZKaiP+w5clzuimV4JGNh8=
X-Received: by 2002:a25:ccd1:: with SMTP id l200mr364902ybf.428.1601430983833; 
 Tue, 29 Sep 2020 18:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
 <20200824074226.GB2466@yuki.lan>
 <CAF12kFvScxqxhY5wXTGL2RKnyM5vM0hEKDc+sHD-3Y=_C7FWcw@mail.gmail.com>
 <20200828130638.GD10501@yuki.lan>
 <CY4PR13MB11754F0072967B32B007D273FD520@CY4PR13MB1175.namprd13.prod.outlook.com>
 <CAF12kFspG2fQKUrA=HGWGQuHy=xJaL0gntqvksq+QmUK3mAdKw@mail.gmail.com>
 <20200903092448.GC6285@yuki.lan>
In-Reply-To: <20200903092448.GC6285@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Wed, 30 Sep 2020 09:55:48 +0800
Message-ID: <CAF12kFvbGhhwyAFnkv+3w2dwvVovTOeE5z+OnqiGz+rQ-5y6ZA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: Orson Zhai <orsonzhai@gmail.com>, xingfeng.kang@unisoc.com,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQUxMOgpJIGNvbnNpZGVyZWQgIHJ1bm5pbmcgbHRwIHdpdGggcmVib290IGZ1bmN0aW9uIGJ5
IEhPU1QgY29udHJvbGxlci4KQW5kIGhlcmUgSSBmb3VuZCB0aGF0IGlmIGNhc2UgbmVlZCByZWJv
b3QgYmVmb3JlIG9yIGFmdGVyIGl0IHJ1bi4gdGhlCkhPU1QgY29udHJvbGxlcgppcyBlYXN5IHRv
IGltcGxlbWVudCwgQlVUIHdoZW4gdGhlIGNhc2Ugd2FudCByZWJvb3QgYmV0d2VlbiBpdCdzIHZl
cmlmeV9mdW5jCkkgaGF2YSBubyBpZGVhIHRoYXQgaG93IHRvIGNvbnRpbnVlIHJ1biB0aGUgcmVz
dCB2ZXJpZnlfZnVuYwpjb250aW51aW5nIGFmdGVyIHJlYm9vdC4KQ2FuIHlvdSBnaXZlIHNvbWUg
Z3VpZGFuY2U/CgpDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4g5LqOMjAyMOW5tDnmnIgz
5pel5ZGo5ZubIOS4i+WNiDU6MjTlhpnpgZPvvJoKPgo+IEhpIQo+ID4gPkFsc28gSSBkbyBjb25z
aWRlciB0aGUgd2hvbGUgY29uY2VwdCBvZiBydW5uaW5nIHRoZSB0ZXN0IGV4ZWN0dXRpb24KPiA+
ID5mcmFtZXdvcmsgb24gdGhlIHNhbWUgbWFjaGluZSBhcyB0aGUgdGVzdGNhc2VzIGJyb2tlbiBi
eSBkZXNpbmcgZm9yCj4gPiA+a2VybmVsIHJlbGF0ZWQgdGVzdHMuIFRoZSB3YXkgZm9yd2FyZCBp
cyB0aGUgcGF0Y2hzZXQgc2VuZCBieSBSaWNoYXJkCj4gPiA+dGhhdCBpbXBsZW1lbnRzIHNpbXBs
ZSB0ZXN0IGV4ZWN1dG9yIHRoYXQgcnVucyBvbiB0aGUgbWFjaGluZSB1bmRlciB0ZXN0Cj4gPiA+
YW5kIGNvbW11bmljYXRlcyB3aXRoIGEgZXhlY3V0aW9uIGZyYW1ld29yayB0aGF0IHJ1bnMgb24g
YSBjZW50cmFsCj4gPiA+c2VydmVyLgo+ID4KPiA+IEkgYWdyZWUgd2l0aCBzb21lIG9mIHlvdXIg
dmlld3M/Pz8gdGhlIHRlc3QgYXJjaGl0ZWN0dXJlIHNlcnZlci9zbGF2ZSBpcyBtb3N0Cj4gPiBj
b21tb24gdGVzdCBtZXRob2QuIGJ1dCBJIGFsc28gd2FudCB0byBrbm93IHdoYXQga2luZCBvZiBj
b25uZWN0aW9uCj4gPiBtZXRob2QgYmV0d2VlbiB0ZXN0IG1hY2hpbmUgYW5kIGNlbnRyYWwgc2Vy
dmVyLCAgdGhlIHNzaCAsIGFkYiBvciBzZXJpYWw/Cj4gPgo+ID4gYmVjYXVzZSBteSB0ZXN0IG1h
Y2hpbmUgaXMgYSBjZWxscGhvbmUsIG91ciBwdXJwb3NlIGlzIHRlc3QgdGhlIGtlcm5lbCBiZWZv
cmUKPiA+IGFuZHJvaWRPUyAsIHNvIEkgYnVpbGQgZGViaWFuT1Mgb24gb3VyIGhhcmF3YXJlLCBh
bmQgd2UgY2FuIG9ubHkgdXNlZCB0aGUKPiA+IHNlcmlhbCBwb3J0IGNvbW11bmljYXRlIHdpdGgg
b3VyIHRlc3RtYWNoaW5lLgo+Cj4gQXMgZm9yIExUUCB0aGUgdG9vbCBSaWNoYXJkIGlzIHdvcmtp
bmcgb24gaXMgYSBkYWVtb24gdGhhdCBydW5zIG9uIHRoZQo+IFNVVFsxXSwgd2lsbCBiZSBxdWl0
ZSBwb3NzaWJseSBzdGFydGVkIGR1cmluZyB0aGUgYm9vdCBhbmQgd2lsbCBsaXN0ZW4KPiBvbiBw
cmUtZGVmaW5lZCB0cmFuc3BvcnQgY2hhbm5lbHMsIGUuZy4gVENQLCBzZXJpYWwsIGJsdWV0b290
aCwgZXRjLiBUaGUKPiBwcm90b2NvbCBpdHNlbGYgc2hvdWxkIGJlIHRyYW5zcG9ydCBhZ25vc3Rp
YyBhbmQgc2hvdWxkIHdvcmsgb3Zlcgo+IGFueXRoaW5nIHRoYXQgY2FuIHRyYW5zcG9ydCBieXRl
cy4gQnV0IHRoYXQgaXMgc29tZXRoaW5nIHRoYXQgaXMgdW5kZXIKPiBkZXZlbG9wbWVudCBhdCB0
aGUgbW9tZW50Lgo+Cj4gLS0KPiBDeXJpbCBIcnViaXMKPiBjaHJ1YmlzQHN1c2UuY3oKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
