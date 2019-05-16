Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B573C20160
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 10:35:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E99D3EA3BD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 10:35:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D65943EA0CD
 for <ltp@lists.linux.it>; Thu, 16 May 2019 10:35:29 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C4FFA1401DA6
 for <ltp@lists.linux.it>; Thu, 16 May 2019 10:35:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7B5093082B6B;
 Thu, 16 May 2019 08:35:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EF031001DC5;
 Thu, 16 May 2019 08:35:26 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 466C31806B11;
 Thu, 16 May 2019 08:35:26 +0000 (UTC)
Date: Thu, 16 May 2019 04:35:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1051593197.23090826.1557995723298.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190516073826.GA14532@dell5510>
References: <20190516073826.GA14532@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.1]
Thread-Topic: Oldest still supported kernel
Thread-Index: 9iI+6t9WkpJN61Y2/cRq6+58S2Hp6w==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 16 May 2019 08:35:26 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] Oldest still supported kernel
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBIaSwKPiAKPiBkbyB3ZSBkZWNsYXJlIG9s
ZGVzdCBzdGlsbCBzdXBwb3J0ZWQga2VybmVsIHZlcnNpb24/Cj4gQWNjb3JkaW5nIHRvIGRpc3Ry
b3dhdGNoIFsxXSBzdGlsbCBzdXBwb3J0ZWQgUkhFTC02LjkgaXMgdXNpbmcgdjIuNi4zMi4KCjYu
OSBpcyBhbHJlYWR5IEVPTCwgYnV0IHRoZXJlIHN0aWxsIGFyZSBvdGhlciBzdXBwb3J0ZWQgUkhF
TDYgc3RyZWFtcyAodXAgdG8gMjAyNCkuCgo+IElzIGl0IHRoZSBvbGRlc3QgdmVyc2lvbiB3ZSB3
YW50IHRvIHN1cHBvcnQgb3IgZXZlbiBzb21ldGhpbmcgb2xkZXI/CgpJJ2QgbGlrZSBtaW5pbXVt
IHRvIGJlIGF0IGxlYXN0IDMuMTAuMCAvIGdsaWJjLTIuMTcgKFJIRUw3KS4KCk9sZGVyIGRpc3Ry
b3MgdXNlIExUUCBtb3N0bHkgZm9yIHJlZ3Jlc3Npb24gdGVzdHMsIHNvIGl0IG1pZ2h0IGJlIGFj
Y2VwdGFibGUKZm9yIHVzZXJzIHRvIHN3aXRjaCB0byBvbGRlciByZWxlYXNlIHRhZywgcmF0aGVy
IHRoYW4gYWx3YXlzIGxhdGVzdCBtYXN0ZXIuCgpUaGVyZSdzIGFsc28gYW4gb3B0aW9uLCB3ZSBj
cmVhdGUgYSAibGVnYWN5IiBicmFuY2ggZm9yIG9sZCBkaXN0cm9zLAphbmQgYWNjZXB0IG9ubHkg
Y3JpdGljYWwgZml4ZXMgKG5vIG5ldyB0ZXN0cywgcmV3cml0ZXMsIGV0Yy4pLiBJdCB3b3VsZApi
ZSB1bnN1cHBvcnRlZCwgYnV0IHByb3ZpZGUgcGxhY2Ugd2hlcmUgbGVnYWN5IHVzZXJzIGNhbiBj
b29wZXJhdGUuCgo+IExhdGVzdCBzdGlsbCBzdXBwb3J0ZWQgc3RhYmxlIGtlcm5lbCBpcyAzLjE2
LCB3aGljaCBpcyBvYnZpb3VzbHkgdG9vIG5ldyBmb3IKPiBlbnRlcnByaXNlIGRpc3Ryb3MuCj4g
Cj4gSXQnZCBiZSBuaWNlIHRvIHNwZWNpZnkgbGF0ZXN0IHN1cHBvcnRlZCBrZXJuZWwgKGFuZCBn
bGliYykgdmVyc2lvbiBpbiBkb2NzCj4gYW5kIHJlbW92ZSBvbGQgYXV0b3Rvb2xzIGNoZWNrcyAo
d2UgaGF2ZSBzb21lIGNoZWNrcyBmb3IgdjIuNi4yNSkuCj4gCj4gS2luZCByZWdhcmRzLAo+IFBl
dHIKPiAKPiBbMV0gaHR0cHM6Ly9kaXN0cm93YXRjaC5jb20vdGFibGUucGhwP2Rpc3RyaWJ1dGlv
bj1yZWRoYXQKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
