Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF74C792
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 08:39:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BE803EA96A
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 08:39:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 391923EA8CD
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 08:39:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D8C4C1000B1B
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 08:39:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F86FAC4C
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 06:39:36 +0000 (UTC)
Date: Thu, 20 Jun 2019 08:39:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190620063931.GA19535@dell5510>
References: <20190614072829.24529-1-camann@suse.com>
 <20190614072829.24529-4-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614072829.24529-4-camann@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3 4/4] syscalls/pidfd_send_signal03
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

SGkgQ2hyaXN0aWFuLAoKPiBBZGQgdGVzdGNhc2UgdG8gY2hlY2sgaWYgdGhlIHN5c2NhbGwgd2ls
bCBzZW5kIGEgc2lnbmFsCj4gdG8gYSBwcm9jZXNzIHdpdGggdGhlIHNhbWUgUElEIGFzIHRoZSB0
YXJnZXRlZCBwcm9jZXNzLgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQW1hbm4gPGNhbWFu
bkBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+CgpX
aG9sZSBwYXRjaHNldCBtZXJnZWQsIHRoeCEKCktpbmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
