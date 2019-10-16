Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427ED8829
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 07:40:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 255DA3C20B6
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 07:40:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A28573C1865
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 07:39:54 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4E6CE1400BEF
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 07:39:54 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0796C9F64C;
 Wed, 16 Oct 2019 05:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1571204393; bh=shAHVQnfCZ9skuw32DQbUUkXadCCzAryhM3BgwLOYV4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=UOw93RK8sZeymgke13zm84/MVI8Seu/41LPTjFntRYVwCP/aWaZbcBR+Z/u5VGEub
 yYpkcre/wEJRNQDwBFHMVjucWFXxTWjyiGc+2R1dCDKyiqnS6yFi02ftYyNCwbAUBJ
 fsnfKHxe7I6UYQvGdCEJLMmgdf2KUtUaIClw8T68=
To: Jan Stancek <jstancek@redhat.com>
References: <20191011053134.18416-1-lkml@jv-coder.de>
 <2097000229.6302768.1571152116580.JavaMail.zimbra@redhat.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <3c5988d6-0e37-6ca8-2567-a98d2ff84dce@jv-coder.de>
Date: Wed, 16 Oct 2019 07:39:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <2097000229.6302768.1571152116580.JavaMail.zimbra@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix/timer_getoverrun/2-3: Fix test for
 systems with low timer precision
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

SGksCj4+IE9uIHN5c3RlbXMgd2l0aCBsb3cgdGltZXIgcHJlY2lzaW9uIHRoZSB0ZXN0IGFsd2F5
cyBmYWlscywgYmVjYXVzZSB0aGUKPj4gYWxsb3dlZAo+PiBtYXhpbXVtIG51bWJlciBvZiBvdmVy
cnVucyBpcyBjYWxjdWxhdGVkIGZyb20gdGhlIGV4cGVjdGVkIG92ZXJydW5zICsgMTAlLgo+IERp
ZCB5b3UgbWVhbiAxJSBoZXJlPwo+ICAgIGZ1ZGdlID0gZXhwZWN0ZWRvdmVycnVucyAvIDEwMDsK
T2YgY291cnNlLCB5b3UgYXJlIHJpZ2h0Cj4KPj4gSWYgdGhlIGV4cGVjdGVkIG92ZXJydW5zIGlz
IGxlc3MgdGhhbiAyMDAsIHRoZXJlIGlzIG5vIHRvbGxlcmFuY2UuCj4+IFRoaXMgaGFwcGVucywg
aWYgdGhlIHByZWNpc2lvbiBvZiB0aGUgdGltZXIgaXMgbGVzcyB0aGFuIG9yIGVxdWFsIHRvIDRt
cy4KPj4gRS5nLiBxZW11LWFybTY0IHdpdGhvdXQgaGlnaCByZXNvbHV0aW9uIHRpbWVyIHRoZSBh
Y2N1cmFjeSBpcyBvbmx5IDRtcy4KPiBXb3VsZCB0d2Vha2luZyB0b2xlcmFuY2Ugd29yayB0b28/
IEUuZy4gdXNlIGZsb2F0LCByb3VuZCB1cC4KQWN0dWFsbHkgcm91bmRpbmcgdXAgd291bGQgbm90
IHdvcmsuIEkgdHJpZWQgaXQgd2l0aCBhIHRpbWVyIGFjY3VyYWN5IG9mIAo0bXMgYW5kIEkgbmVl
ZGVkCmF0IGxlYXN0IGEgZnVkZ2Ugb2YgdHdvLiBSb3VuZGluZyB1cCB3b3VsZCBvbmx5IHJlc3Vs
dCBpbiBvbmUuIFRoYXQgaXQgCndoeSBJIGRlY2lkZWQgdG8KZ28gZm9yIGV4dGVuZGluZyB0aGUg
ZHVyYXRpb24KPgo+IEkgd2FzIGFzc3VtaW5nIC0xIGluIG9yaWdpbmFsIGNvZGUgaXMgdG8gY29w
ZSB3aXRoIGZpbmFsIHRpbWVyIGV4cGlyYXRpb24gb2YgdHNzbGVlcC50dl9zZWMsCj4gd2hpY2gg
bWlnaHQgbm90IGJlIGNvdW50ZWQgYXMgIm92ZXJydW4iLiBXaGF0IGRvZXMgdGhlIC0xIGRvIGlu
IHlvdXIgZm9ybXVsYT8KPiBXaHkgaXMgaXQgaW5zaWRlIGJyYWNrZXRzPwpZb3UgbWF5IGJlIHJp
Z2h0LiBJIGFtIG5vdCBjb21wbGV0ZWx5IHN1cmUgd2hhdCBpdCBpcyB1c2VkIGZvciwgYnV0IEkg
Cmd1ZXNzIHlvdSBhcmUgcmlnaHQuCj4KPiBXaGVuIEkgdHJ5IHRvIGZvcmNlIGRpZmZlcmVudCBp
bnRlcnZhbCB2YWx1ZXMsIGl0IGZhaWxzIGZvciBtZSAob24geDg2KToKPiAzbXMKPiAjIC4vdGlt
ZXJfZ2V0b3ZlcnJ1bl8yLTMucnVuLXRlc3QKPiBkdXJhdGlvbiA9IDcgc2VjLCBpbnRlcnZhbCA9
IDYwMDAwMDAgbnNlYywgZXhwZWN0ZWQgb3ZlcnJ1bnMgPSAxMTU1Cj4gMTE2NiBvdmVycnVucyBv
Y2N1cnJlZAo+IEZBSUw6ICAxMTY2IG92ZXJydW5zIHNlbnQ7IGV4cGVjdGVkIDExNTUKPgo+IDVt
cwo+ICMgLi90aW1lcl9nZXRvdmVycnVuXzItMy5ydW4tdGVzdAo+IGR1cmF0aW9uID0gMTEgc2Vj
LCBpbnRlcnZhbCA9IDEwMDAwMDAwIG5zZWMsIGV4cGVjdGVkIG92ZXJydW5zID0gMTA4OQo+IDEx
MDAgb3ZlcnJ1bnMgb2NjdXJyZWQKPiBGQUlMOiAgMTEwMCBvdmVycnVucyBzZW50OyBleHBlY3Rl
ZCAxMDg5CkhvdyBpcyBpdCBwb3NzaWJsZSB0byBmb3JjZSB0aGUgdGltZXIgcmVzb2x1dGlvbj8g
SSB0ZXN0ZWQgb24gcWVtdQp3aXRoIGFhcmNoNjQgYW5kIHg4Nl82NCB3aXRoIGFuZCB3aXRob3V0
IGhpZ2hyZXM9b2ZmIGFuZCBpciB3b3JrZWQuCgpJZiB0aGUgLTEgaXMgb3V0c2lkZSB0aGUgYnJh
Y2tldHMsIGl0IHdvdWxkIGZpeCBib3RoIG9mIHlvdXIgdGVzdCBjYXNlcy4KKDExNTUgKyA3IC0g
MSnCoCA9IDExNjE7ICsxJSA9IDExNzIgLT4gZXhwZWN0ZWQgb3ZlcnJ1bnMgWzExNjEsIDExNzIp
CigxMDg5ICsgMTEgLSAxKSA9IDEwOTk7ICsxJSA9IDExMDkgLT5leHBlY3RlZCBvdmVycnVucyBb
MTA5OSwgMTEwOSkKCkrDtnJnCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
