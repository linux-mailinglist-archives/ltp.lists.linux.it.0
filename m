Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB304C8A2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 09:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8824B2988D4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 09:47:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7DC232987A9
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 09:47:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 72E6814016BD
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 09:47:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7CAABAD27
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 07:47:07 +0000 (UTC)
Date: Thu, 20 Jun 2019 09:47:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190620074703.GC13879@dell5510>
References: <20190607141622.20316-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607141622.20316-1-camann@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1] syscalls/acct02: Fix wrongfully failing
 sometimes
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

SGkgQ2hyaXN0aWFuLAoKPiBPbiBzb21lIHN5c3RlbXMgdGhlIHByb2Nlc3MgY2FsbGluZyBhY2N0
KCkgaGFzIHRvIGVuZCBiZWZvcmUKPiBwcm9jZXNzIGFjY291bnRpbmcgaXMgc3RhcnRlZC4gVGhp
cyBjYXVzZWQgdGhlIG9yaWdpbmFsIHRlc3QKPiB0byBmYWlsIG9uIHRob3NlIHN5c3RlbXMuCj4g
VGhpcyBmaXggZm9ya3MgYSBjaGlsZCBwcm9jZXNzIHRvIGNhbGwgYWNjdCgpIGluIG9yZGVyIHRv
Cj4gYWN0aXZhdGUgcHJvY2VzcyBhY2NvdW50aW5nIGJlZm9yZSBydW5uaW5nIHRoZSB0ZXN0IHBy
b2dyYW0uCgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBBbWFubiA8Y2FtYW5uQHN1c2UuY29t
PgoKUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKVGhhbmtzIGZvciB5
b3UgcGF0Y2guIENvdWxkIHlvdSBiZSBwbGVhc2UgbW9yZSBzcGVjaWZpYz8KKHdoaWNoIGtlcm5l
bCB2ZXJzaW9uIC8gZ2xpYmMpCgpJJ20gdGVzdGluZyBpdCBvbiB2YXJpb3VzIGRpc3Ryb3MsIGFs
bCBoYXZlIHN0cnVjdCBhY2N0X3YzIGFuZCBhbGwgZmFpbAoocmVnYXJkbGVzcyB0aGlzIHBhdGNo
KToKRkFJTDogYWNjdCgpIHdyb3RlIGluY29ycmVjdCBmaWxlIGNvbnRlbnRzIQoKS2luZCByZWdh
cmRzLApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
