Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09FFBD1
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 16:46:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4ACB33EACC8
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 16:46:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 18FC53EA05E
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 16:46:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03A0A600F9D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 16:46:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1BF32ADA3;
 Tue, 30 Apr 2019 14:46:22 +0000 (UTC)
Date: Tue, 30 Apr 2019 16:46:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190430144620.GA17822@dell5510>
References: <20190430144346.GA16914@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430144346.GA16914@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] TST_BRK_SUPPORTS_ONLY_TCONF_TBROK() error message
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

SGkgSmFuLAoKPiB5b3VyIGNvbW1pdCAwNzM4ZTM3NTMgKCJsaWI6IGJ1aWxkIGNoZWNrIHBhcmFt
ZXRlcnMgZm9yIHRzdF9icmsoKSIpIGFkZGVkIGNoZWNrCj4gZm9yIGludmFsaWQgdHlwZXMuIEkg
Z3Vlc3Mgd2UgZGlkbid0IGZpbmQgYSB3YXkgaG93IHRvIHByaW50IG1lYW5pbmdmdWwgZXJyb3IK
PiBtZXNzYWdlIGUuZy4gInRzdF9icmsoKTogaW52YWxpZCB0eXBlLCBwbGVhc2UgdXNlIFRCUk9L
L1RDT05GL1RGQUlMIiBhcyBYaWFvCj4gc3VnZ2VzdGVkIFsxXS4gQmVjYXVzZSBlcnJvciBtZXNz
YWdlIG9uIHRzdF9icmsoVElORk8sICJmb28iKSBpcyBhIGJpdAo+IGNvbmZ1c2luZzoKQXQgbGVh
c3Qgb24gZ2NjIDguMy4KCj4gLi4vLi4vLi4vLi4vaW5jbHVkZS90c3RfY29tbW9uLmg6Njk6MjU6
IGVycm9yOiBzaXplIG9mIHVubmFtZWQgYXJyYXkgaXMgbmVnYXRpdmUKPiAgIGRvIHsgKCh2b2lk
KXNpemVvZihjaGFyWzEgLSAyICogISEoY29uZGl0aW9uKV0pKTsgfSB3aGlsZSAoMCkKCktpbmQg
cmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
