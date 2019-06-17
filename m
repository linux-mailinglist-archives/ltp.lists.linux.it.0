Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE84948B
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:49:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82EAC3EB0BA
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:49:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 059B33EA4B7
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:49:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AF65910000EA
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:48:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 25FC9AECD;
 Mon, 17 Jun 2019 21:49:03 +0000 (UTC)
Date: Mon, 17 Jun 2019 23:49:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190617214901.GC19347@x230>
References: <20190615042048.29839-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615042048.29839-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
 structure
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

SGkgTGksCgo+IFRlc3RjYXNlcyBmb3Igc3BlY2lmaWVkIGFyY2ggc2hvdWxkIGJlIGxpbWl0ZWQg
b24gdGhhdCBvbmx5IGJlaW5nIHN1cHBvcnRlZAo+IHBsYXRmb3JtIHRvIHJ1biwgd2Ugbm93IGNy
ZWF0ZSBhIGZ1bmN0aW9uIHRzdF9vbl9hcmNoIHRvIGFjaGlldmUgdGhpcyBuZXcKPiBmZWF0dXJl
IGluIExUUCBsaWJyYXJ5LiAgQWxsIHlvdSBuZWVkIHRvIHJ1biBhIHRlc3Qgb24gdGhlIGV4cGVj
dGVkIGFyY2ggaXMKPiB0byBzZXQgdGhlICcuYXJjaCcgc3RyaW5nIGluIHRoZSAnc3RydWN0IHRz
dF90ZXN0JyB0byBjaG9vc2UgdGhlIHJlcXVpcmVkCj4gYXJjaCBsaXN0LiBlLmcuICcuYXJjaCA9
ICJ4ODZfNjQgaTM4NiInLgpKdXN0IG9uZSBub3RlLCBzdHJpbmdzIGFyZSBlcnJvciBwcm9uZS4g
SSB3b25kZXIgaWYgZGVmaW5pbmcgY29uc3RhbnRzIGFuZCB1c2luZwphcnJheSB3b3VsZCBiZSB0
b28gY29tcGxpY2F0ZWQgZm9yIHRoaXMgdXNlIGNhc2UuCgoKS2luZCByZWdhcmRzLApQZXRyCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
