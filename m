Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F642810
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 15:54:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A68603EAE28
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 15:54:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9268D3EA6C3
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 15:54:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 656E7600E45
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 15:54:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8EF2AF74
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 13:54:37 +0000 (UTC)
Date: Wed, 12 Jun 2019 15:54:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190612135436.GA15090@x230>
References: <20190604114702.28255-1-camann@suse.com>
 <20190604114702.28255-2-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604114702.28255-2-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/4] syscalls/pidfd_send_signal02
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

SGkgQ2hyaXN0aWFuLAoKPiBBZGQgdGVzdCB0byBjaGVjayBiYXNpYyBlcnJvciBoYW5kbGluZyBv
ZiB0aGUgc3lzY2FsbC4KCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEFtYW5uIDxjYW1hbm5A
c3VzZS5jb20+ClJldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KCi4uLgo+
ICsjZGVmaW5lIF9HTlVfU09VUkNFCkFnYWluLCBpZiBub3QgbmVlZGVkLCByZW1vdmUgaXQuCgo+
ICsKPiArI2luY2x1ZGUgPHNpZ25hbC5oPgo+ICsjaW5jbHVkZSAicHdkLmgiCiNpbmNsdWRlIDxw
d2QuaCI+CgpUaGUgcmVzdCBMR1RNLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
