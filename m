Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0110AB42
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Nov 2019 08:41:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DFD33C2262
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Nov 2019 08:41:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5D2743C1CED
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 08:41:34 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 618421003AB6
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 08:41:34 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0224B9F73F
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1574840493; bh=NTokVdh2iw+U+NWLQS+vhqshSl3WmgnppJ4MR3Ls6Qw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ohP4O64c/TCThvDZfYtXS7bWlyE5mdf7kGOIO0MN2NNk37KpOv0KOqBN+PSblWpCx
 mnSUkjJ0DGq85DGpUUXIKJL/iCTU8/IbJY92iOcEpl9fkCyRkffbub9nYa+bJdv74L
 AxnctIkc6pncga9E/ymttg7x+D71UGUCvBRLwujs=
To: ltp@lists.linux.it
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
 <20191125153245.GA15129@rei.lan>
 <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
 <20191126121038.GC16922@rei.lan>
 <42d40727-f631-39ff-fdc0-576e13336a4d@jv-coder.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <fb1559d9-6d1b-a870-f7b6-471f7599c1fd@jv-coder.de>
Date: Wed, 27 Nov 2019 08:41:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <42d40727-f631-39ff-fdc0-576e13336a4d@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg_lib/memcg_process: Better synchronization
 of signal USR1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4+Cj4+IFNvIHRoZSBwcm9ibGVtIGlzIHRoYXQgc29tZXRpbWVzIHRoZSBwcm9ncmFtIGhh
cyBub3QgZmluaXNoZWQgaGFuZGxpbmcKPj4gdGhlIGZpcnN0IHNpZ25hbCBhbmQgd2UgYXJlIHNl
bmRpbmcgYW5vdGhlciwgcmlnaHQ/Cj4+Cj4+IEkgZ3Vlc3MgdGhhdCB0aGUgcHJvcGVyIHNvbHV0
aW9uIHdvdWxkIGJlIGF2b2RpbmcgdGhlIHNpZ25hbHMgaW4gdGhlCj4+IGZpcnN0IHBsYWNlLiBJ
IGd1ZXNzIHRoYXQgd2UgY2FuIGVzdGFiaWxpc2ggdHdvLXdheSBjb21tdW5pY2F0aW9uIHdpdGgK
Pj4gZmlmb3MsIHdoaWNoIHdvdWxkIGFsc28gbWVhbiB0aGF0IHdlIHdvdWxkIGdldCBub3RpZmll
ZCBhcyBmYXN0IGFzIHRoZQo+PiBjaGlsZCBkaWVzIGFzIHdlbGwuCj4gQ29ycmVjdC4gVXNpbmcg
Zmlmb3MgaXMgcHJvYmFibHkgYSB2aWFibGUgc29sdXRpb24sIGJ1dCBpdCB3b3VsZCAKPiByZXF1
aXJlIGxpYnJhcnkgd29yaywKPiBiZWNhdXNlIG90aGVyd2lzZSB0aGUgb3ZlcmhlYWQgaXMgd2F5
IHRvbyBiaWcuCj4gQW5vdGhlciB0aGluZyBJIGNhbiB0aGluayBvZiBpcyBleHRlbmRpbmcgdHN0
X2NoZWNrcG9pbnQgd2FpdCB0byBhbHNvIAo+IHdhdGNoIGEgcHJvY2Vzcwo+IGFuZCBzdG9wIHdh
aXRpbmcsIGlmIHRoYXQgcHJvY2VzcyBkaWVzLiBUaGlzIHdvdWxkIGJlIHRoZSBzaW1wbGVzdCB3
YXkgCj4gdG8gZ2V0IGdvb2QKPiBzeW5jaHJvbml6YXRpb24gYW5kIGdldCByaWQgb2YgdGhlIHNs
ZWVwLgo+CldoZW4gdGhpbmtpbmcgYWJvdXQgdGhpcyB5ZXN0ZXJkYXksIEkgaGFkIGFub3RoZXIg
aWRlYSB0byBmaXggaXQgd2l0aG91dCAKbXVjaCB3b3JrOgpGb3IgdGhlIHRlc3QsIHRoYXQgZXhw
ZWN0cyB0aGUgcHJvY2VzcyB0byB0ZXJtaW5hdGUsIGp1c3QgZG9uJ3QgY2FsbCAKdHN0X2NoZWNr
cG9pbnQgYXQKYWxsLiBXZSBrbm93IGl0IHdpbGwgZmFpbCB0aGVyZS4gV291bGQgdGhpcyBiZSBh
Y2NlcHRhYmxlIGZvciB5b3U/CgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
