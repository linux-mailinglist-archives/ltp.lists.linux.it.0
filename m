Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD32FF40
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:18:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF8BD3EA656
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:18:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3B9703EA133
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:18:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A362C6006EE
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:18:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41659AFE7;
 Thu, 30 May 2019 15:18:46 +0000 (UTC)
Date: Thu, 30 May 2019 17:18:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Caspar Zhang <caspar@linux.alibaba.com>
Message-ID: <20190530151843.GA25602@rei>
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 1/3] tst_test: fix again when test has both TPASS
 and TCONF
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

SGkhCj4gQ29uc2lkZXIgdGhpcyBzaXR1YXRpb246IHdlIGdldCBvbmx5IFRQQVNTIGFuZCBUQ09O
RiBpbiB0ZXN0Cj4gcmVzdWx0cywgYW5kIHRoZSBsYXN0IHN0YXR1cyBoYXBwZW5zIHRvIGJlIFRQ
QVNTLCB0aGUgY2hlY2sKPiBjb25kaXRpb24gaW4gY29tbWl0IGZlY2RkODg1ZWI0YiAoInRzdF90
ZXN0OiBGaXggZXhpdCB2YWx1ZSBvbgo+IHRzdF9icmsoVENPTkYsIC4uLikiIHdvbid0IHdvcmsu
IEZpeCBpdCBieSByZW1vdmluZyB1bm5lY2Vzc2FyeQo+IFRDT05GIGNoZWNrLgoKV2hhdCBpcyB0
aGUgZXhhY3Qgc2VxdWVuY2Ugb2YgdGhlIHRzdF9yZXMoKS90c3RfYnJrKCkgY2FsbHMgbGVhZGlu
ZyB0bwp0aGlzPwoKQmVjYXVzZSBpZiB0aGUgdGVzdCBmdW5jdGlvbiBoYXMgZXhpdHRlZCB3aXRo
IDAgdGhlIGRvX2V4aXQoKSBmdW5jdGlvbgp3b3VsZCBiZSBwYXNzZWQgMCBhbmQgdGhhdCBjYXNl
IGlzIGhhbmRsZWQgYWxyZWFkeToKCglpZiAocmVzdWx0cy0+c2tpcHBlZCAmJiAhcmVzdWx0cy0+
cGFzc2VkKQoJCXJldCB8PSBUQ09ORjsKCj4gRml4ZXM6IDUzOTBkNmVhMzY1NyAoImxpYi90c3Rf
dGVzdDogUmVwb3J0IDAgaWYgdGVzdCBoYXMgYm90aCBUUEFTUyBhbmQgVENPTkYiKQo+IFNpZ25l
ZC1vZmYtYnk6IENhc3BhciBaaGFuZyA8Y2FzcGFyQGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+
ICBsaWIvdHN0X3Rlc3QuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi90c3RfdGVzdC5jIGIvbGliL3Rz
dF90ZXN0LmMKPiBpbmRleCAyZDg4YWRiZDcuLjhiYTEyMmZiZSAxMDA2NDQKPiAtLS0gYS9saWIv
dHN0X3Rlc3QuYwo+ICsrKyBiL2xpYi90c3RfdGVzdC5jCj4gQEAgLTU5NCw3ICs1OTQsNyBAQCBz
dGF0aWMgdm9pZCBkb19leGl0KGludCByZXQpCj4gIAkJcHJpbnRmKCJza2lwcGVkICAlZFxuIiwg
cmVzdWx0cy0+c2tpcHBlZCk7Cj4gIAkJcHJpbnRmKCJ3YXJuaW5ncyAlZFxuIiwgcmVzdWx0cy0+
d2FybmluZ3MpOwo+ICAKPiAtCQlpZiAocmVzdWx0cy0+cGFzc2VkICYmIHJldCA9PSBUQ09ORikK
PiArCQlpZiAocmVzdWx0cy0+cGFzc2VkKQo+ICAJCQlyZXQgPSAwOwoKLS0gCkN5cmlsIEhydWJp
cwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
