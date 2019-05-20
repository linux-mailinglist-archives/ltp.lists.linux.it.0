Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 600C6230C7
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 11:54:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30FDB2987A4
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 11:54:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A6779298784
 for <ltp@lists.linux.it>; Mon, 20 May 2019 11:53:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AADFC600784
 for <ltp@lists.linux.it>; Mon, 20 May 2019 11:54:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80F77AF2D;
 Mon, 20 May 2019 09:53:57 +0000 (UTC)
Date: Mon, 20 May 2019 11:53:57 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Sandeep Patil <sspatil@android.com>
Message-ID: <20190520095356.GB25405@rei.lan>
References: <20190520041730.28238-1-sspatil@android.com>
 <20190520041730.28238-2-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520041730.28238-2-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH 1/1] open_posix_testsuite/pthread_sigmask: fix
 return value checks
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

SGkhCj4gQ29uc2lzdGVudGx5IHVzZSBlcnJvcigzKSBhbmQgcmVwbGFjZSBhbGwgb2NjdXJlbmNl
cyBvZiBwZXJyb3IoKQo+IGF0IHRoZSBzYW1lIHRpbWUuCgpUaGUgZXJyb3IoMykgaXMgR05VIGV4
dGVuc2lvbiB3ZSBjYW5ub3QgdXNlIGl0IGluIGEgUE9TSVggdGVzdHN1aXRlIGFzCnN1Y2gsIEkg
Z3Vlc3MgdGhhdCB3ZSB3aWxsIGhhdmUgdG8gYWRkIGN1c3RvbSBlcnJvciByZXBvcnRpbmcgZnVu
Y3Rpb25zCihpbiBhIHNlcGFyYXRlIHBhdGNoKSB0byB0aGUgb3Blbl9wb3NpeF90ZXN0c3VpdGUv
aW5jbHVkZS9wb3NpeHRlc3QuaApoZWFkZXIuLi4KCk90aGVyIHRoYW4gdGhhdCB0aGUgcGF0Y2gg
aXMgb2J2aW91c2x5IGNvcnJlY3QuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
