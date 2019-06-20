Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E60C84CD19
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 13:50:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94CA329897A
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 13:50:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D8EDD3EA221
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 13:49:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D2FF41A008A8
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 13:49:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 107D5AF84;
 Thu, 20 Jun 2019 11:49:58 +0000 (UTC)
Date: Thu, 20 Jun 2019 13:49:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190620114952.GA31382@dell5510>
References: <20190515143746.GA7507@dell5510>
 <1557989579-3661-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557989579-3661-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] security: add missing
 PR_CAPBSET_READ/PR_CAPBSET_DROP check
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

SGkgWWFuZywKCj4gUFJfQ0FQQlNFVF9SRUFEL1BSX0NBUE5TRVRfRFJPUCB3YXMgYWRkZWQgc2lu
Y2UgbGludXgyLjYuMjUsCj4gY3VycmVudCBsdHAgZGV0ZWN0ZWQgdGhlbSBpbiBsdHAtcHJjdGwu
bTQsIGJ1dCB0aHJlZSBwbGFjZXMKPiBtaXNzZWQgdGhpcyBjaGVjay4gU28gYWRkIGl0LCBmaXgg
cG9zc2libGUgY29tcGlsZXIgZXJyb3IKPiBvbiBzb21lIG9sZCBkaXJ0cm9zIHdpdGhvdXQgUFJf
Q0FQQlNFVF9SRUFEL1BSX0NBUE5TRVRfRFJPUCBmbGFnLgoKVGhhbmtzIGZvciB5b3VyIHBhdGNo
LCBtZXJnZWQuCgpCVFcgdGhlc2UgY2FwIGZpbGVzIHdvdWxkIGRlc2VydmUgY29udmVydGluZyBp
bnRvIG5ldyBBUEkuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
