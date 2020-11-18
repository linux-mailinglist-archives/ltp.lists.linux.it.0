Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC52B7758
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 08:54:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B0B33C4EFE
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 08:54:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E21BC3C280C
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 08:54:33 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4B29B1A010ED
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 08:54:33 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D2EB2A07FE;
 Wed, 18 Nov 2020 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605686071; bh=6gghS3D+OjpLW1t+socyswZ0y8cwDc4vTHmY+IXwMNg=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=s7Hk4HTIDgvFZOPUKbnojuTyo4RZOiegWTryyumavJ3wXYvExMqiXlVg5gawqfxe7
 3G39kdyhgxWP/hA5B2I4tefw0HqOiU02y44m4tvAI17oTIfLOr8j5wos/ZgXpVWAhD
 kjEkRiHt2Jo8a5AGVvysaxOo8J04rXoLR5RK+MIY=
To: rpalethorpe@suse.de
References: <20201116130915.18264-1-lkml@jv-coder.de> <875z64pc1r.fsf@suse.de>
 <648d7b53-2451-718b-6736-e6dffd4c72e8@jv-coder.de>
 <873618p7ns.fsf@suse.de>
 <0d2a3cc5-e257-ebc5-1488-2a186411d8ad@jv-coder.de> <87zh3gnod3.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <2ff51aa8-a017-35b2-5fd3-87f1483a62cb@jv-coder.de>
Date: Wed, 18 Nov 2020 08:54:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <87zh3gnod3.fsf@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/1] overcommit_memory: Remove unstable subtest
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

SGksCgpJIGRpZCBzb21lIGV4cGVyaW1lbnRzIGFuZCBtYWRlIHRoZSBwZXIgY3B1IGNvdW50ZXJz
IHZpc2libGUuIFRoZW4gSSAKcmVhbGl6ZWQga2VybmVsIGRldmVsb3BlcnMgYXJlIG5vdCB0aGF0
IHN0dXBpZCA7KQpUaGUgcGVyIGNwdSBjb3VudGVycyBjYW4gb25seSBncm93IHVwIHRvIGJhdGNo
IHNpemUgYW5kIGRvd24gdG8gbmVnYXRpdmUgCmJhdGNoIHNpemUsIHRoZW4gdGhleSBhcmUgZmx1
c2hlZCBiYWNrIHRvIHRoZSBnbG9iYWwgY291bnRlci4KClRoYXQgbWVhbnMgdGhlIGNvdW50ZXIg
c2VlbiBieSBfX3ZtX2Vub3VnaF9tZW1vcnkgY2FuIG9ubHkgYmUgb2ZmIGluIHRoZSAKaW50ZXJ2
YWwgWy1udW1jcHUgKiBiYXRjaF9zaXplLCBudW1jcHUgKiBiYXRjaF9zaXplXS4gU28gdGhlIHRl
c3QgY2FuIGJlIApmaXhlZCBieSB0cnlpbmcgdG8gYWxsb2NhdGUgY29tbWl0X2xlZnQgKyBudW1j
cHUgKiBiYXRjaF9zaXplLgpOb3cgdGhlIG9ubHkgcHJvYmxlbSBpcywgdGhhdCB0aGUgYmF0Y2gg
c2l6ZSBpcyBub3QgdmlzaWJsZSB0byAKdXNlcnNwYWNlLCBzbyBoYXMgdG8gYmUgY2FsY3VsYXRl
ZC4gSXQgZGVwZW5kcyBvbiB0aGUgbnVtYmVyIG9mIGNwdXMgYW5kIAp0b3RhbCBtZW1vcnkgcGFn
ZXM6Cm1heChuY3B1cyoyLCAzMiwgbWluKGludDMyX21heCwgcmFtX3BhZ2VzIC8gbmNwdXMgLyAy
NTYpID0gYmF0Y2hfc2l6ZSAKKGluIHBhZ2VzKQoKSSBndWVzcyB3ZSBjYW4gZGV0ZXJtaW5lIHRo
ZXNlIHR3byB2YWx1ZXMgZnJvbSB1c2Vyc3BhY2UgYW5kIGFkZCB0aGUgCmJhdGNoIHNpemUgdG8g
Y29tbWl0X2xlZnQuCkkgd2lsbCBwcmVwYXJlIGEgbmV3IHBhdGNoIHdpdGggdGhpcyBhcHByb2Fj
aC4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
