Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13C3FEF10
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 16:01:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 489EE3C939D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 16:01:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6EE8F3C2982
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 16:01:50 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 56465600826
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 16:01:50 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 1445B9F66D;
 Thu,  2 Sep 2021 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630591309; bh=P8cjP5or8w5po4BloIUrNci1Dw5stU9GJrbjt5QA1og=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=DtzKIqj7GK3nY+YBgoN6cUT//FYg3XNFrffq7fR0hf/uL3IbB+lB9YJfeUBDiFp2R
 tvdNhn3K4Y9SSzEdYzmeaPeL/lRaRzDDQW+IYH43O0+E5uNcDKrvDedzq52tl1cuEm
 4xXVeTxeLoi321UJqMn5mqnC/m52sc4Idn9X9mmg=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210902103740.19446-1-pvorel@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de>
Date: Thu, 2 Sep 2021 16:01:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902103740.19446-1-pvorel@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/4] checkbashisms.pl in make check + fixed docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkKCm9uZSBnZW5lcmFsIHF1ZXN0aW9uIGFib3V0IHRoaXM6IEhvdyB0byB3ZSB3YW50IHRvIGhh
bmRsZSBmYWxzZS1wb3NpdGl2ZXM/CgplLmcuOgoKJCBjaGVja2Jhc2hpc21zIHRlc3RjYXNlcy9r
ZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIuc2gKcG9zc2libGUg
YmFzaGlzbSBpbiAKdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFs
L21lbWNnX2xpYi5zaCBsaW5lIDM4NyAKKCcoKCcgc2hvdWxkIGJlICckKCgnKToKIMKgwqDCoMKg
wqDCoMKgIGxvY2FsIGxpbWl0X2Rvd249JCgoIFBBR0VTSVpFICogKChsaW1pdCArIFBBR0VTSVpF
IC0gMSkgLyAKUEFHRVNJWkUpICkpCgpUaGlzIGlzIG9idmlvdXNseSBhIGZhbHNlIHBvc2l0aXZl
LCBidXQgY291bGQgcHJvYmFibHkgYmUgYWRkaW5nIGEgc3BhY2UgCmJldHdlZW4gdGhlIGJyYWNr
ZXRzLgoKb3IKCiQgY2hlY2tiYXNoaXNtcyB0ZXN0Y2FzZXMva2VybmVsL2Nvbm5lY3RvcnMvcGVj
L2NuX3BlYy5zaApwb3NzaWJsZSBiYXNoaXNtIGluIHRlc3RjYXNlcy9rZXJuZWwvY29ubmVjdG9y
cy9wZWMvY25fcGVjLnNoIGxpbmUgMTI3IAooc2hvdWxkIGJlID53b3JkIDI+JjEpOgogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvbmUgPCYke2ZkX2FjdH0KClRoaXMgb25lIGlzIGp1
c3QgYSBmYWxzZSBwb3NpdGl2ZSBhbmQgSSBoYXZlIG5vIGNsdWUgaG93IHRvIHByZXZlbnQgdGhp
cy4KSSB0aGluayB0aGUgc2NyaXB0IGRvZXMgbm90IGxpa2UgdGhlIDwmLCBidXQgdGhpcyBpcyBw
b3NpeC4uLgoKSm9lcmcKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
