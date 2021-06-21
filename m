Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B7B3AE470
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:01:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C5903C703D
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 10:01:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 078953C2192
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:01:14 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 97F0220091B
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 10:01:13 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8C7C39F7FD;
 Mon, 21 Jun 2021 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624262465; bh=32zzzhS0IkcVWfWPlC9524HfIrEc8BZ6V3P4Vo+ueng=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=T8Ll9zj1P7hnN7rWJIXBL025DU6OiOl4wmPycvaem9MYJV/LDl7Xv4kXloS0tDdIz
 3tOacULrc1p4eMc22ao4tJ507lJtvs+cXeEDhdv5hnjRx0UCVZ9dgjjPwuAv5HFjGf
 HC5LcqWtPSj5n7NBvI6L8SZS1V1BCzTpAeflclvw=
To: Petr Vorel <pvorel@suse.cz>
References: <20210519063109.224352-1-lkml@jv-coder.de>
 <20210519063109.224352-2-lkml@jv-coder.de> <YKToUgBnK6ZQ5I0Q@yuki>
 <2f8e652b-aaa8-5f98-4f9d-5b7c138c17fa@jv-coder.de> <YNA+6shWiWYRNi2P@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <3fd9fb2f-3242-5268-eef3-0e5aa4faecef@jv-coder.de>
Date: Mon, 21 Jun 2021 10:01:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNA+6shWiWYRNi2P@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] shell: Extend timeout tests,
 to run on multiple shells
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

SGkgUGV0ciwKCk9uIDYvMjEvMjAyMSA5OjI1IEFNLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIGFs
bCwKPgo+IEkgd29uZGVyIHdoYXQgaXMgdGhlIHN0YXRlIG9mIHRoaXMgcGF0Y2hzZXQ/Cj4gRG8g
d2Ugc3RpbGwgY29uc2lkZXIgaXQ/Ckkgc3RpbGwgdGhpbmsgdGhpcyBzaG91bGQgYmUgaW5jbHVk
ZWQsIGJ1dCB3ZSBjYW4gZHJvcCBzaGVsbHMgaWYgeW91IGxpa2UuCj4gQXBhcnQgZnJvbSByZWR1
Y2luZyBzaGVsbHMgKGkuZS4gd2hpY2ggZGlzdHJvIGhhcyBhc2gsIHdoaWNoIGlzIG5vdAo+IGFs
aWFzIHRvIG90aGVyIHNoZWxsIGluIHRoZSBsaXN0KSBJJ20gbm90IGFnYWluc3Qgbm9uLWRlZmF1
bHQgc2hlbGxzLCBidXQgSQo+IGRvbid0IGxpa2UgaG93IHdob2xlIHRlc3QgZ2V0cyBjb21wbGlj
YXRlZCBieSB0aGlzLgo+Cj4gQWxzbyB3ZSdyZSByZWludmVudGluZyB3aGVlbCB3aXRoIHByaW50
aW5nIHJlc3VsdHMsIGNoZWNraW5nIHdoZXRoZXIgdGVzdCBleGlzdAo+IGV0Yy4gTWF5YmUgdXNp
bmcgdGVzdCBBUEkgZm9yIHRoaXM/Ckkga25vdyB0aGF0IHRoaXMgaXMgcmVpbXBsZW1lbnRpbmcg
YSBsb3Qgb2Ygc3R1ZmYsIGJ1dCBJIHRoaW5rIEkgdHJpZWQgCnVzaW5nIHRoZSBsaWIgKGEgYml0
IHN0cmFuZ2UgdXNpbmcgdGhlIG9iamVjdCB1bmRlciB0ZXN0IHRvIHRlc3QgaXQsIGJ1dCAKd291
bGQgYmUgb2sgZm9yIG1lKSwgYnV0IGZhaWxlZCB0byBkbyBzby4KSSBndWVzcyB0aGlzIHdhcyBi
ZWNhdXNlIGl0IHVzZXMgdHJhcHMgYW5kIHRoZSBzZXQgLW0gc3R1ZmYsIGJ1dCBJIGFtIApub3Qg
c3VyZSBhbnltb3JlLgoKSsO2cmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
