Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B25221531
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:38:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AC043C2C17
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:38:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B47A53C29A2
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:38:23 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5A20F1000D80
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:38:23 +0200 (CEST)
Received: from [192.168.1.21] (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 98EA320B4909;
 Wed, 15 Jul 2020 12:38:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 98EA320B4909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1594841901;
 bh=6+Oy96GDeWcYO3bA6soGvFgHrrxXgSLwlsMbiPmwJHk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lxbO83fnCbJ7WMpt0a2w837LV51kVRK3aNhqnekQCNI2bQmO8XIe6Hnwjzz/m+5sk
 89YSkibntsmYm8PPgwy7cdOLoB3hJ6MyUQb4Rcv9aQlPfx5s3P1Sm9uXSjCxcOAH2i
 2vCx1o3BUsD6lNSs5DeI1AElILAxpMdpjuH5WolM=
To: Mimi Zohar <zohar@linux.ibm.com>, pvorel@suse.cz, ltp@lists.linux.it
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-2-t-josne@linux.microsoft.com>
 <1594774692.12900.220.camel@linux.ibm.com>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <53323968-55b9-68ae-dc3f-de9cbd223ff1@linux.microsoft.com>
Date: Wed, 15 Jul 2020 15:38:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1594774692.12900.220.camel@linux.ibm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] IMA: Verify that the kernel cmdline is passed
 and measured correctly through the kexec barrier.
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ck9uIDcvMTQvMjAgODo1OCBQTSwgTWltaSBab2hhciB3cm90ZToKPiBPbiBUaHUsIDIwMjAtMDct
MDIgYXQgMTE6MzUgLTA0MDAsIExhY2hsYW4gU25lZmYgd3JvdGU6Cj4+IEFkZCBhIHRlc3RjYXNl
IHRoYXQgdmVyaWZpZXMgdGhhdCBrZXhlYyBjb3JyZWN0bHkgbG9ncyB0aGUKPj4ga2VybmVsIGNv
bW1hbmQgbGluZSB0byB0aGUgSU1BIGJ1ZmZlciBhbmQgdGhhdCB0aGUgY29tbWFuZAo+PiBsaW5l
IGlzIHRoZW4gY29ycmVjdGx5IG1lYXN1cmVkLgo+Pgo+PiBUaGlzIHRlc3QgbXVzdCBiZSBydW4g
c3RhbmRhbG9uZSwgc2luY2UgaXQgcnVucyBrZXhlYwo+PiBtdWx0aXBsZSB0aW1lcyAoYW5kIHRo
ZXJlZm9yZSByZWJvb3RzIHNldmVyYWwgdGltZXMpLgo+IFZlcmlmeWluZyB0aGUga2V4ZWMgYm9v
dCBjb21tYW5kIGxpbmUgZG9lc24ndCByZXF1aXJlIHJlYm9vdGluZy4gwqBKdXN0Cj4gbG9hZGlu
ZyB0aGUga2V4ZWMga2VybmVsIGltYWdlIHNob3VsZCBiZSBlbm91Z2ggKGtleGVjIC1zIC1sKS4K
PiAgwqBWZXJpZnlpbmcgdGhhdCB0aGUgbWVhc3VyZW1lbnQgbGlzdCwgaW5jbHVkaW5nIHRoZSBr
ZXhlYyBib290IGNvbW1hbmQKPiBsaW5lLCBpcyBjYXJyaWVkIGFjcm9zcyBrZXhlYyBjb3VsZCBi
ZSBhIHNlcGFyYXRlIHRlc3QuCgpUaGlzIGlzIHRydWUuIEhvd2V2ZXIsIGl0IG9ubHkgYXBwZW5k
cyB0byB0aGUgSU1BIGxvZyBvbmNlLCBldmVuIGlmIHlvdSAKdW5sb2FkIChga2V4ZWMgLXVgKSB0
aGUga2V4ZWMga2VybmVsIGFmdGVyIGBrZXhlYyAtcyAtbCAuLi5gLgoKVGhlcmVmb3JlLCB0aGUg
dGVzdCB3b3VsZCBvbmx5IGJlIGFibGUgdG8gY2hlY2sga2V4ZWMgd2l0aCB0aGUgY21kbGluZSAK
c3VwcGxpZWQgaW4gb25lIHdheS4KCkkgd2lsbCBoYXZlIHRvIGNoZWNrIGludGVybmFsbHkgaWYg
dGhhdCdzIHRoZSByaWdodCB3YXkgdG8gZ28uIElmIGl0IApkaWRuJ3QgbmVlZCB0byByZWJvb3Qs
IHRoZW4gdGhlIHRlc3QgY291bGQgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBub3JtYWwgCklNQSB0
ZXN0cywKd2hpY2ggd291bGQgZGVmaW5pdGVseSBiZSBhIGdvb2QgdGhpbmcuCgpSZWdhcmRzLAoK
TGFjaGxhbgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
