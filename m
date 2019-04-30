Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF1FBC2
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 16:43:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDEE63EACBB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 16:43:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6C0293EAC9D
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 16:43:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF6DD200B17
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 16:43:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C37C3ADA3;
 Tue, 30 Apr 2019 14:43:48 +0000 (UTC)
Date: Tue, 30 Apr 2019 16:43:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190430144346.GA16914@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] TST_BRK_SUPPORTS_ONLY_TCONF_TBROK() error message
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

SGkgSmFuLAoKeW91ciBjb21taXQgMDczOGUzNzUzICgibGliOiBidWlsZCBjaGVjayBwYXJhbWV0
ZXJzIGZvciB0c3RfYnJrKCkiKSBhZGRlZCBjaGVjawpmb3IgaW52YWxpZCB0eXBlcy4gSSBndWVz
cyB3ZSBkaWRuJ3QgZmluZCBhIHdheSBob3cgdG8gcHJpbnQgbWVhbmluZ2Z1bCBlcnJvcgptZXNz
YWdlIGUuZy4gInRzdF9icmsoKTogaW52YWxpZCB0eXBlLCBwbGVhc2UgdXNlIFRCUk9LL1RDT05G
L1RGQUlMIiBhcyBYaWFvCnN1Z2dlc3RlZCBbMV0uIEJlY2F1c2UgZXJyb3IgbWVzc2FnZSBvbiB0
c3RfYnJrKFRJTkZPLCAiZm9vIikgaXMgYSBiaXQKY29uZnVzaW5nOgoKLi4vLi4vLi4vLi4vaW5j
bHVkZS90c3RfY29tbW9uLmg6Njk6MjU6IGVycm9yOiBzaXplIG9mIHVubmFtZWQgYXJyYXkgaXMg
bmVnYXRpdmUKICBkbyB7ICgodm9pZClzaXplb2YoY2hhclsxIC0gMiAqICEhKGNvbmRpdGlvbild
KSk7IH0gd2hpbGUgKDApCgoodGhpcyBpcyBub3QgcmVsYXRlZCB0byBjdXJyZW50IHJlbGVhc2Ug
ZWZmb3J0KQoKS2luZCByZWdhcmRzLApQZXRyCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9jb21tZW50LzIwMjYzNzgvCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
