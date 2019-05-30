Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 948622FAB3
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 13:10:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A7613EA670
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 13:10:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 12C6D3EA0B8
 for <ltp@lists.linux.it>; Thu, 30 May 2019 13:10:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C2127601231
 for <ltp@lists.linux.it>; Thu, 30 May 2019 13:10:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11B62AE99;
 Thu, 30 May 2019 11:10:31 +0000 (UTC)
Date: Thu, 30 May 2019 13:10:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190530111030.GC31468@rei.lan>
References: <20190530102336.10898-1-xzhou@redhat.com>
 <20190530102336.10898-2-xzhou@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530102336.10898-2-xzhou@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] syscalls: update tcases using dev_fs_type to
 use some_filesystems
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

SGkhCj4gU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5jb20+Cj4gLS0t
Cj4gIC4uLi9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmlsZV9yYW5nZTAy
LmMgICB8IDggKysrKysrLS0KCkkgZ3Vlc3MgdGhhdCB3ZSBjYW4gZW5hYmxlIHRoZSB0aGlzIHRl
c3QgZm9yIGFsbCBmaWxlc3lzdGVtcywgdGhlcmUgaXMKaW4ta2VybmVsIGZhbGxiYWNrIGZvciBm
aWxlc3lzdGVtcyB0aGF0IGRvZXMgbm90IHN1cHBvcnQgdGhlIHN5c2NhbGwgc28KaXQgc2hvdWxk
IHdvcmsgb24gYWxsIGZpbGVzeXN0ZW1zIGFuZCB0aGUgZmFsbGJhY2sgY29kZSBzaG91bGQgYmUg
dGVzdGVkCmFzIHdlbGwuCgo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dl
dHhhdHRyMDQuYyAgICAgICAgICAgfCA3ICsrKysrLS0KCldlbGwgSSB3b3VsZCBiZSBzbGlnaHRs
eSBpbiBmYXZvciBvZiBlbmFibGluZyB0aGlzIHRlc3QgZm9yIGFsbApmaWxlc3lzdGVtcyBhcyB3
ZWxsLgoKSWYgd2UgZXZlciB3YW50IHRvIG1haW50YWluIGxpc3Qgb2YgZmlsZXN5c3RlbXMgdGhh
dCBzdXBwb3J0IGV4dGVuZGVkCmF0dHJpYnV0ZXMgdGhlcmUgc2hvdWxkIGJlIG9ubHkgb25lIHNv
bWV3aGVyZSBpbiB0aGUgdGVzdCBsaWJyYXJ5IHNvCnRoYXQgd2UgZG9uJ3QgaGF2ZSB0byBjaGFu
Z2UgdGhvdXNhbmQgdGVzdGNhc2VzIGxhdGVyIG9uLgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1Ymlz
QHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
