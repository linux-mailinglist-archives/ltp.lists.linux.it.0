Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14048376
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 15:06:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 748DD3EB0B5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 15:06:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 209333EA1BB
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 15:06:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CE902100152F
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 15:06:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19B46AFE1;
 Mon, 17 Jun 2019 13:06:24 +0000 (UTC)
Date: Mon, 17 Jun 2019 15:06:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20190617130623.GC16831@rei>
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <CAEemH2eLToM0D+XwHop5jzsfCb3psGbtM7ygZ1Zgm9ZN0UhzYg@mail.gmail.com>
 <CAFA6WYO-s8j746sSiM9dcMV4Lp7Cg77OugECPM=t5hFSmdpxHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYO-s8j746sSiM9dcMV4Lp7Cg77OugECPM=t5hFSmdpxHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
 sync test-cases
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

SGkhCj4gRG8geW91IGhhdmUgYW55IGZ1cnRoZXIgY29tbWVudHMgb24gdGhpcyBwYXRjaD8KCk5v
dCB5ZXQsIEknbSBhYm91dCB0byByZXZpZXcgaXQuCgo+IEluIGNhc2Ugd2UgZG9uJ3QgaGF2ZSBh
bnkgZnVydGhlciBjb21tZW50cywgd291bGQgeW91IGxpa2UgbWUgdG8gc2VuZAo+IG5leHQgdmVy
c2lvbiB3aXRoIGNvZGUgY29tbWVudHMgYXMgc3VnZ2VzdGVkIGJ5IExpIG9yIHRoZXkgY2FuIGJl
Cj4gaW5jb3Jwb3JhdGVkIHdoaWxlIGFwcGx5aW5nIHRoZSBwYXRjaD8KCk5vIG5lZWQgdG8gcmVz
ZW5kLCBJIGNhbiBhZGQgdGhlIGNvbW1lbnQgbXlzZWxmLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1
YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
