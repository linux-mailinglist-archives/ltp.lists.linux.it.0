Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8011D8F10
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 07:10:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57F263C4E96
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 07:10:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 833F23C24DD
 for <ltp@lists.linux.it>; Tue, 19 May 2020 07:10:52 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3E71A6023C4
 for <ltp@lists.linux.it>; Tue, 19 May 2020 07:10:51 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.1.13])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E1B06A32A5;
 Tue, 19 May 2020 05:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1589865051; bh=wp5X3EDVY8hY5gNFx762rU/KJM3kjC3YC+1PWO8K6k4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=uHGa8/2OBJddYn0ukvN3lde4rGcOdOLOyt/3+FSzLGiJ4oBW73WvmXxXVcv80Om+u
 6dLvHH3wtx2icWdensLsscvG5ZNSlUvV2vblFmG7PlaO5dromKVzvy2mLeH9nKOnb5
 7NTXn/0Dn3kVB6CAQCDHFtqpNmO7VZFiG0Zf5tXU=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200518130132.19312-1-pvorel@suse.cz>
 <20200518130132.19312-2-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <033366de-ed10-f494-600a-51aed8639613@jv-coder.de>
Date: Tue, 19 May 2020 07:10:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518130132.19312-2-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Warn about setup/cleanup
 function not loaded
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCnRoaXMgbG9va3MgZ29vZCwganVzdCBvbmUgc21hbGwgdHlwby4gQW5kIEkgZ3Vl
c3MgSSB3b3VsZCByYWlzZSB0aGlzIHRvIApUQlJPSywgYnV0IHRoYXQKaXMganVzdCBteSBwZXJz
b25hbCBwcmVmZXJlbmNlIDopCgpBbSAxOC4wNS4yMDIwIHVtIDE1OjAxIHNjaHJpZWIgUGV0ciBW
b3JlbDoKPiArCQlpZiB0eXBlICIkVFNUX0NMRUFOVVAiID4vZGV2L251bGwgMj4mMTsgdGhlbgo+
ICsJCQkkVFNUX0NMRUFOVVAKPiArCQllbHNlCj4gKwkJCXRzdF9yZXMgVFdBUk4gImNsZWFudXAg
ZnVuY3Rpb24gc2V0IChUU1RfU0VUVVA9JyRUU1RfQ0xFQU5VUCcpLCBidXQgbm90IGZvdW5kICh0
ZXN0IGJ1ZykiClRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIFRTVF9DTEVBTlVQPS4uLi4KCgpKw7Zy
ZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
