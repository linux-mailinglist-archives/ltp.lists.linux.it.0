Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C64492C58A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 13:38:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9083A3EA4E8
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 13:38:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A0E033EA1EF
 for <ltp@lists.linux.it>; Tue, 28 May 2019 13:38:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EA44B1A00F41
 for <ltp@lists.linux.it>; Tue, 28 May 2019 13:38:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F383ACBA
 for <ltp@lists.linux.it>; Tue, 28 May 2019 11:38:48 +0000 (UTC)
Date: Tue, 28 May 2019 13:38:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190528113847.GB14548@rei>
References: <20190515120116.11589-1-camann@suse.com>
 <20190515120116.11589-3-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515120116.11589-3-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/pidfd_send_signal02
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

SGkhCj4gK3N0YXRpYyB2b2lkIHZlcmlmeV9waWRmZF9zZW5kX3NpZ25hbCh1bnNpZ25lZCBpbnQg
bikKPiArewo+ICsJc3RydWN0IHRjYXNlICp0YyA9ICZ0Y2FzZXNbbl07Cj4gKwo+ICsJVEVTVCh0
c3RfcGlkZmRfc2VuZF9zaWduYWwoKnRjLT5mZCwgdGMtPnNpZ25hbCwgdGMtPnNpZ2luZiwgdGMt
PmZsYWdzKSk7Cj4gKwlpZiAodGMtPmV4cF9lcnIgIT0gVFNUX0VSUikgewo+ICsJCXRzdF9yZXMo
VEZBSUwgfCBUVEVSUk5PLAo+ICsJCQkicGlkZmRfc2VuZF9zaWduYWwoKSBkaWQgbm90IGZhaWwg
d2l0aCAlcyBidXQiLAo+ICsJCQl0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKPiArCQlyZXR1
cm47Cj4gKwl9Cj4gKwo+ICsJdHN0X3JlcyhUUEFTUywKPiArCQkicGlkZmRfc2VuZF9zaWduYWwo
KSBmYWlsZWQgYXMgZXhwZWN0ZWQhIik7CgpJIHRlbmQgdG8gcGFzcyBUVEVSUk5PIHRvIHRoZSBw
YXNzaW5nIG1lc3NhZ2UgZm9yIG5lZ2F0aXZlIHRlc3RjYXNlcwpsaWtlIHRoaXMgb25lIHNvIHRo
YXQgdGhlIG91dHB1dCBoYXMgc29tZSBpbmZvcm1hdGlvbiBhYm91dCB3aGF0IGhhcwpiZWVuIHRl
c3RlZC4KCkkgd291bGQgaGF2ZSBkb25lIHNvbWV0aGluZyBhcyBoZXJlOgoKCXRzdF9yZXMoVFBB
U1MgfCBUVEVSUk5PLCAicGlkZmRfc2VuZF9zaWduYWwoKSBmYWlsZWQiKTsKCk90aGVyIHRoYW4g
dGhpcyB0aGUgdGVzdCBsb29rcyBnb29kLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2Uu
Y3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
