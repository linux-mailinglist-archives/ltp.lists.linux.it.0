Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FA2FA8B
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:51:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB5003EA6A6
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:51:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E0F6C3EA166
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:51:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 72AF01A01194
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:51:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8F041AE1D;
 Thu, 30 May 2019 10:51:41 +0000 (UTC)
Date: Thu, 30 May 2019 12:51:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190530105140.GB31468@rei.lan>
References: <20190530102336.10898-1-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530102336.10898-1-xzhou@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_test: introduce
	tst_test->some_filesystems
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gTGlrZSBhbGxfZmlsZXN5c3RlbXMsIHNvbWVfZmlsZXN5c3RlbXMgb3B0aW9uIGxldCB0
Y2FzZSB0byBydW4gb24KPiBzcGVjaWZpYyBmaWxlc3lzdGVtcy4KPiBJbiBvcmRlciB0byBpbXBs
ZW1lbnQgdGhpcywgY2hhbmdlIHJ1bl90Y2FzZXNfcGVyX2ZzIHRvIGFjY2VwdCBhCj4gcGFyYW1l
dGVyIGluZGljYXRpbmcgd2hpY2ggZmlsZXN5c3RlbXMgbmVlZCB0byB0ZXN0Lgo+IAo+IFRvIGxl
dCB0Y2FzZSB1c2UgdGhpcyBvcHRpb24sIHdlIG5lZWQgc29tZSBvdGhlciBmbGFncyBzZXQKPiBF
ZzoKPiBzdGF0aWMgY2hhciAqc29tZV9maWxlc3lzdGVtc1tdID0geyJleHQ0IiwgInhmcyIsICJi
dHJmcyJ9Owo+IAo+ICAgLm1vdW50X2RldmljZSA9IDAsCj4gICAubmVlZHNfZGV2aWNlID0gMSwK
PiAgIC5mb3JtYXRfZGV2aWNlID0gMSwKPiAgIC5tbnRwb2ludCA9IE1OVFBPSU5ULAo+ICAgLnNv
bWVfZmlsZXN5c3RlbXMgPSBzb21lX2ZpbGVzeXN0ZW1zLAoKQ2FuJ3Qgd2UganVzdCBjaGFuZ2Ug
dGhlIGRldl9mc190eXBlIHRvIGRldl9mc190eXBlcyBhcnJheSBpbnN0ZWFkPwoKLS0gCkN5cmls
IEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
