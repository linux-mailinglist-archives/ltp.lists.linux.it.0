Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 653BC341340
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 03:56:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F3A83C7A82
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 03:56:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8F3723C6087
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 03:56:18 +0100 (CET)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C624E1401198
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 03:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=OP4jN
 uDaRpfcWbTIlsHEdajmOp4V6g2Wn4X6JA1o9JU=; b=QjqPDH/LbciV9U4Pxfn6Q
 PI7k5ihsNA+R/2Rs4voBU4Fw+8vz1EMHYyTB3zsi5CHMKbp2b5M1K9B/w0Z/O54G
 pgKLcnlYttDZNdxKrlnn245OeIJXT/B6SJjGRVhWZxdQcrDNdULXLLZ2cB8TJoCp
 J7gDdoPFxeAxS+Dhvq+kCA=
Received: from localhost.localdomain (unknown [223.104.145.210])
 by smtp7 (Coremail) with SMTP id C8CowAAXEfHIElRgdlDzSw--.24651S2;
 Fri, 19 Mar 2021 10:56:09 +0800 (CST)
To: Petr Vorel <pvorel@suse.cz>, Martin Doucha <mdoucha@suse.cz>
References: <20210318162409.9871-1-mdoucha@suse.cz> <YFOcOJP4innlbIk4@pevik>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <920d81b2-567a-4e28-58f7-b27151b1cad7@163.com>
Date: Fri, 19 Mar 2021 10:56:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YFOcOJP4innlbIk4@pevik>
Content-Language: en-US
X-CM-TRANSID: C8CowAAXEfHIElRgdlDzSw--.24651S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw17Cw4xKw47KrWDGFWrAFb_yoWxKFgEgF
 15CFn7Cw4DXw1Fgr1fuFs5GrWfJayYvFnrJr1UAF17G34Sga1UurWDXw1Sq3yS9FWrtws2
 gr1q9F93Z3srWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn8HUDUUUUU==
X-Originating-IP: [223.104.145.210]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiygpahFQHLbPkxQAAsy
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0cgo+IEhpIE1hcnRpbiwKPgo+PiBUaGUgbGliYyB0ZXN0IHZhcmlhbnQgc2hvdWxkIHJ1
biBvbmx5IGlmIHN5c3RlbSBoZWFkZXJzIGRlZmluZSBTRU1fU1RBVF9BTlkuCj4+IFNraXAgaXQg
aWYgd2UncmUgZmFsbGluZyBiYWNrIHRvIHRoZSBMQVBJIGRlZmluaXRpb24uCj4gUmV2aWV3ZWQt
Ynk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+Cj4gVGhhbmtzIQo+Cj4gLi4uCj4+ICsj
aWYgIUhBVkVfREVDTF9TRU1fU1RBVF9BTlkKPiBuaXQ6IEknZCBwcmVmZXIKPiAjaWZuZGVmIEhB
VkVfREVDTF9TRU1fU1RBVF9BTlkKKzEKPj4gKwlpZiAodHN0X3ZhcmlhbnQgPT0gMSkKPj4gKwkJ
dHN0X2JyayhUQ09ORiwgImxpYmMgZG9lcyBub3Qgc3VwcG9ydCBzZW1jdGwoU0VNX1NUQVRfQU5Z
KSIpOwo+PiArI2VuZGlmCj4gQWx0aG91Z2ggSSB1bmRlcnN0YW5kIHdoeSB5b3Ugd2FudCB0byBx
dWl0IG9ubHkgdGVzdHMgd2l0aCByb290Cj4gKG9ubHkgdGhlc2UgZmFpbCksIGl0J3MgYSBiaXQg
Y29uZnVzaW5nIHRvIHRlc3Qgd2l0aCB1c2VyIG5vYm9keQo+IGFuZCB0aGVuIHF1aXQgdGhlIHNh
bWUgdGVzdGluZyB3aXRoIHJvb3QuCgpJIGRvbid0IGdldCB0aGlzLsKgIE1hcnRpbiBvbmx5IHdh
bnRzIHRvIHNraXAgbGliYyB0ZXN0IHdoZW4gdW5kZWZpbmVkIAphbmQgaXQgZG9lc24ndCBtYXR0
ZXIgd2hpY2ggdXNlciB3ZSB1c2UuCgoKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+CgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
