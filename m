Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1194929990
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:58:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D45C93EA6CC
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:58:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 34A953EA2E7
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:58:32 +0200 (CEST)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C8D4A1B601D7
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=+/1ZD
 YS5qXx0g6ugpyrmrnVwYJN0bNVYz0I4qk0IZmE=; b=EVK3yEZnwjoIiRYIobcEK
 iJxMTHUPFefOrnpwiczWlsNuxbxAc0i93miu+nTCAPAQUeZ3lzSPK/B16MZGvlzw
 RiPzH/9CnMbn3BSD8cwYl99nzJ9CnjzP8aQg6BwTHdFoggky7lkOr0HnQS8RQdIp
 Z3LsC39CtZeCg4eSof3hEU=
Received: from [192.168.0.6] (unknown [183.211.128.41])
 by smtp13 (Coremail) with SMTP id EcCowACHjxeE+OdcrzkzHw--.9885S2;
 Fri, 24 May 2019 21:58:29 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <70578dc6-1a6b-9ab1-1298-0539ae8562f9@163.com>
 <1558684246-2658-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <b6b85048-ff36-9681-05bd-2131721efd4f@163.com> <20190524134849.GB2251@rei>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <7113d89a-3eb8-5671-bb6a-26cc4cbb69bf@163.com>
Date: Fri, 24 May 2019 21:58:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190524134849.GB2251@rei>
Content-Language: en-US
X-CM-TRANSID: EcCowACHjxeE+OdcrzkzHw--.9885S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKw1rCr1rCFyUWryrGw45Wrg_yoW8Jr4fpa
 9xZa47KF4DGFZ5JanF93W7ur93Zr95KF13t3yDXF1DCr1qvrZaya40gFW5GFnrCrn5Aw4a
 qw47Gr9rK3s8ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b5Wl9UUUUU=
X-Originating-IP: [183.211.128.41]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEAW+XlWBl1ZoPwAAs3
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl05.c: New test for prctl() with
 PR_{SET, GET}_NAME
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMDUvMjQvMjAxOSAwOTo0OCBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IEhpIQo+Pj4gKwlp
ZiAoc3RyY21wKHRjLT5leHBuYW1lLCBidWYpKQo+Pj4gKwkJdHN0X3JlcyhURkFJTCwKPj4+ICsJ
CQkicHJjdGwoUFJfR0VUX05BTUUpIGZhaWxlZCAsZXhwZWN0ZWQgJXMsIGdvdCAlcyIsIHRjLT5l
eHBuYW1lLCBidWYpOwo+Pj4gKwllbHNlCj4+PiArCQl0c3RfcmVzKFRQQVNTLAo+Pj4gKwkJCSJw
cmN0bChQUl9HRVRfTkFNRSkgc3VjY2VlZGVkLCB0aHJlYWQgbmFtZSBpcyAlcyIsIGJ1Zik7Cj4+
IEhpIFh1LAo+Pgo+PiBJdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGNvbnRpbnVlIGlmIGJ1ZiBtaXNt
YXRjaGVzIHRjLT5leHBuYW1lLgo+Pgo+Pj4gKwo+Pj4gKwl0aWQgPSB0c3Rfc3lzY2FsbChfX05S
X2dldHRpZCk7Cj4+PiArCj4+PiArCXNwcmludGYoUFJPQ19OQU1FX1BBVEgsICIvcHJvYy9zZWxm
L3Rhc2svJWQvY29tbSIsIHRpZCk7Cj4+PiArCVNBRkVfRklMRV9TQ0FORihQUk9DX05BTUVfUEFU
SCwgIiVzIiwgY29tbV9idWYpOwo+PiBZb3UgZGlkbid0IGNyZWF0ZSBtdWx0aXBsZSB0aHJlYWRz
IGhlcmUgc28gaXQgc2VlbXMgc2ltcGxlciB0byB1c2UKPj4gL3Byb2Mvc2VsZi9jb21tCj4+IGlu
c3RlYWQgb2YgL3Byb2Mvc2VsZi90YXNrLzx0aWQ+L2NvbW0uIGRvIHlvdSB0aGluayBzbz8KPj4g
UGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIHVybCBmb3IgZGV0YWlsczoKPj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9wcm9jLnR4dAo+IEFjdHVhbGx5IHdlIHNob3Vs
ZCBjaGVjayBib3RoLgpIaSBDeXJpbCwKClRoYW5rcyBmb3IgeW91ciBxdWljayByZXBseS4KCkl0
J3MgYmV0dGVyIHRvIGNoZWNrIGJvdGguCj4+IEJUVzoKPj4gU2hvdWxkIHdlIHByaW50IHRocmVl
IFRQQVNTIG1lc3NhZ2VzIGZvciBvbmUgdGVzdD8KPj4gQ2FuIHdlIHJlcGxhY2UgcHJldmlvdXMg
VFBBU1Mgd2l0aCBUSU5GTyBhbmQgdGhlbiBwcmludCBUUEFTUyBhdCB0aGUgZW5kPwo+IEkgdGhp
bmsgdGhhdCBpdCdzIGNsZWFuZXIgdG8gcHJpbnQgUEFTUy9GQUlMIG1lc3NhZ2UgZm9yIGVhY2gg
c3VidGVzdC4KT0ssIHdlIGNhbiBrZWVwIGl0IGFzIHlvdSBzYWlkLgoKQmVzdCBSZWdhcmRzLApY
aWFvIFlhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAo=
