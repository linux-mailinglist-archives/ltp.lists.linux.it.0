Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA814837
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:14:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B83943EAE78
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:14:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DAF563EA0E9
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:14:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A5D291A014B0
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:14:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EBD8DAB91;
 Mon,  6 May 2019 10:14:13 +0000 (UTC)
References: <20190403152245.GC26464@rei.lan>
 <20190411192534.30525-1-fedebonfi95@gmail.com>
 <20190412143318.GA29856@haruka.lan>
User-agent: mu4e 1.0; emacs 26.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Federico Bonfiglio <fedebonfi95@gmail.com>
In-reply-to: <20190412143318.GA29856@haruka.lan>
Date: Mon, 06 May 2019 12:14:13 +0200
Message-ID: <874l67x53e.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] NS_* ioctl commands fail in 32bit compat mode (-m32)
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CkhlbGxvIEZlZGVyaWNvLAoKQWxsIHRoZSB0ZXN0cyBmYWlsIHdpdGggc29tZXRoaW5nIHNpbWls
YXIgdG86CmlvY3RsX25zMDEuYzo0NTogRkFJTDogdW5leHBlY3RlZCBpb2N0bCBlcnJvcjogRU5P
VFRZCgp3aGVuIGNvbXBpbGVkIHdpdGggdGhlIC1tMzIgZmxhZyBvbiBhdCBsZWFzdCBTVVNFIGtl
cm5lbCA0LjIwIGFuZAo0LjEyLgoKRG8geW91IGtub3cgaWYgdGhpcyBmZWF0dXJlIGlzIGV4cGVj
dGVkIHRvIHdvcmsgaW4gMzJiaXQgY29tcGF0IG1vZGU/Ck1heWJlIHRoZSBzaXplIG9mIHRoZSBh
cmd1bWVudHMgc2hvdWxkIGJlIGRpZmZlcmVudCB3aGVuIHVzaW5nIDMyYml0IG1vZGU/CgotLQpU
aGFuayB5b3UsClJpY2hhcmQuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
