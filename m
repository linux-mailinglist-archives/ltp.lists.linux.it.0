Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068621ACB
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 17:41:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF0223EA5BE
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 17:41:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 10C8B3EA4E0
 for <ltp@lists.linux.it>; Fri, 17 May 2019 17:41:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 090E3202999
 for <ltp@lists.linux.it>; Fri, 17 May 2019 17:41:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D4BBACF5;
 Fri, 17 May 2019 15:41:07 +0000 (UTC)
Date: Fri, 17 May 2019 17:41:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20190517154105.GB11796@dell5510>
References: <20190405165225.27216-1-pvorel@suse.cz>
 <20190514121213.GA28655@dell5510>
 <1557889279.4581.14.camel@linux.ibm.com>
 <20190515120853.GA22992@dell5510>
 <1558044649.4507.10.camel@linux.ibm.com>
 <20190517075057.GA12489@dell5510>
 <1558090823.4507.50.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558090823.4507.50.camel@linux.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Ignaz Forster <iforster@suse.de>, linux-integrity@vger.kernel.org,
 Marcus Meissner <meissner@suse.com>, ltp@lists.linux.it,
 Fabian Vogt <FVogt@suse.com>
Subject: Re: [LTP] [PATCH v2 0/3] LTP reproducer on broken IMA on overlayfs
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTWltaSwKCj4gT24gRnJpLCAyMDE5LTA1LTE3IGF0IDA5OjUwICswMjAwLCBQZXRyIFZvcmVs
IHdyb3RlOgoKPiA+IElmIGl0J3Mgb2sgZm9yIHlvdSBhbmQgaXQncyBhIHZhbGlkIHRlc3QgZG8g
eW91IGdpdmUgYW4gYWNrPwoKPiBPZiBjb3Vyc2UhICBUaGFua3MhClRoYW5rcyEgSSdsbCBhZGQg
YWxzbyBJZ25heidzIGRlc2NyaXB0aW9uIChjcmVhdGUgUkVBRE1FLm1kIGluIElNQSBmb2xkZXIp
LAp0aHVzIHByb2JhYmx5IHNlbmQgYSB2MyB0byBNTCBmaXJzdCwgYnV0IG5vdCBleHBlY3Rpbmcg
dG8gZ2V0IG11Y2ggcmV2aWV3IDopLgoKPiBNaW1pCgpLaW5kIHJlZ2FyZHMsClBldHIKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
