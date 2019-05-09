Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 321981864B
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 09:41:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC3063EABD0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 09:41:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B057A3EABBF
 for <ltp@lists.linux.it>; Thu,  9 May 2019 09:41:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 75E5414088CE
 for <ltp@lists.linux.it>; Thu,  9 May 2019 09:41:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CED3CAE2E
 for <ltp@lists.linux.it>; Thu,  9 May 2019 07:41:35 +0000 (UTC)
Date: Thu, 9 May 2019 09:41:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190509074134.GA22704@dell5510>
References: <20190508112822.27255-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508112822.27255-1-camann@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/rt_sigqueueinfo01: rewrote testcase
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

SGkgQ2hyaXN0aWFuLAoKPiBUaGUgcHJldmlvdXMgaW1wbGVtZW50YXRpb24gb25seSB0ZXN0ZWQg
aWYgdGhlIHN5c2NhbGwgY2FuCj4gYmUgY2FsbGVkIGF0IGFsbC4gTm93IGl0IGFsc28gY2hlY2tz
IGlmIHRoZSBjb3JyZWN0IHNpZ25hbAo+IGFuZCBkYXRhIGlzIHNlbnQgYW5kIHJlY2VpdmVkLgoK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQW1hbm4gPGNhbWFubkBzdXNlLmNvbT4KQWNrZWQt
Ynk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
