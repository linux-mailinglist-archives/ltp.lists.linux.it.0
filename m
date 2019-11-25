Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77697108F26
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 14:48:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3078C3C224B
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 14:48:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E662E3C21DD
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 14:48:15 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5F2161401133
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 14:48:15 +0100 (CET)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C83F29F655;
 Mon, 25 Nov 2019 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1574689693; bh=A9IVCN+5Ch+dDFUr3CNI3TeaGt5a0028rhDly1nCcjQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=tWdgCYxxuHdOLHZT1dkaniptw6A0FqGYOTythSb3HYZ31oFTjwpxmXkjrw9z4SMhN
 8l5zjgip7rnHc8LickBnzwLhR9eoMYEyTzkt4Op7RWZXA8dgv5hhLQZXiKChQ59NHS
 Zj51GMNeMvtJjA+qwByOvCPW+Aa/+8OfJUblQQKs=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
Date: Mon, 25 Nov 2019 14:48:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125132957.GC8703@rei.lan>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsCgo+IEhpIQo+PiBBY3R1YWxseSB0aGlzIGRvZXMgbm90IHdvcmsgbGlrZSB0aGlz
LCBiZWNhdXNlIHNvbWUgb2YgdGhlCj4+IHRlc3RzIHRyaWdnZXIgdGhlIG9vbSBraWxsZXIgYW5k
IFRFU1RfQ0hFQ0tQT0lOVF9XQUlUIGNhbGxpbmcKPj4gdHN0X2NoZWNrcG9pbnQgdXNlcyBST0Qu
IElzIGl0IG9rIHRvIGRpcmVjdGx5IGNhbGwKPj4KPj4gdHN0X2NoZWNrcG9pbnQgd2FpdCAxMDAw
MCAiMSIKPj4KPj4gYW5kIGlnbm9yZSB0aGUgcmVzdWx0IGhlcmU/Cj4gV291bGRuJ3QgdGhhdCBk
ZWxheSB0aGUgdGVzdCBmb3IgdG9vIGxvbmc/Cj4KPiBUaGUgZGVmYXVsdCB0aW1lb3V0IGZvciBj
aGVja3BvaW50cyBpcyBwcm9iYWJseSB0b28gYmlnLgo+Cj4gVGhpcyBwcm9ibGVtIGlzIHF1aXRl
IHRyaWNreSB0byBnZXQgcmlnaHQgSSBndWVzcy4gTWF5YmUgd2UgY2FuIHdhdGNoCj4gL3Byb2Mv
W3BpZF0vc3RhdG0gZm9yIGluY3JlYXNlIGRhdGEgKyBzdGFjayBtZW1vcnkuClRoZSB0aW1lb3V0
IGlzIHNwZWNpZmllZCBvbiB0aGUgY29tbWFuZCBsaW5lICh0aGUgMTAwMDApIGluIG1zLgpXZSBy
dW4gdGhlIHRlc3Qgd2l0aCB0aW1lb3V0PTEwMDAgbm93IGFuZCBpdCB3b3JrcyBmaW5lLiBJdCBp
cyBzaW1wbGVyIAp0aGFuIHRoaW5raW5nIGFib3V0IGFueQpvdGhlciBzeW5jaHJvbml6YXRpb24g
dGVjaG5pcXVlLiBUaGUgYWRkaXRvbmFsIHdhaXQgYWRkcyBsZXNzIHRoYW4gMzAgCmZvciBhbGwg
dGVzdHMsIHRoYXQgdXNlIG1lbWNnX3Byb2Nlc3MuCj4+IEJUVzogSXMgdGhlcmUgbm8gc3VjaCB0
aGluZyBsaWtlIFRTVF9DSEVDS1BPSU5UIGluIHRoZSBuZXcKPj4gc2hlbGwgdGVzdCBsaWJyYXJ5
Pwo+IEl0IGRvZXMgbm90IHNlZW0gdG8gYmUgdGhlcmUsIGJ1dCB0aGVzZSBzaGVsbCBmdW5jdGlv
bnMgYXJlIGp1c3QKPiB3cmFwcGVycyB0aGF0IGRvIGNoZWNrIHRoZSB0c3RfY2hlY2twb2ludCBy
ZXR1cm4gdmFsdWUsIHdoaWNoIHdvdWxkIGJlCj4gZmFpcmx5IGVhc3kgdG8gYWRkLgpJIGp1c3Qg
d29uZGVyZWQgaWYgSSBkaWRuJ3Qgc2VlIGl0CgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
