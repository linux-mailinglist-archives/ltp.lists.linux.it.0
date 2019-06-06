Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09625374DF
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 15:10:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2BFB3EAA04
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 15:10:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 57CA83EA9BC
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 15:10:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C8EE1000B4E
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 15:10:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C278AF38
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 13:10:17 +0000 (UTC)
Date: Thu, 6 Jun 2019 15:10:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190606131015.GA12020@rei>
References: <20190604114702.28255-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604114702.28255-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/pidfd_send_signal01
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

SGkhCldoZW4gSSBhdHRlbXB0eSB0byBjb21waWxlIHRoaXMgY29kZSBJIGdldDoKCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSBwaWRmZF9zZW5kX3NpZ25hbC5oOjExOjAsCiAgICAgICAgICAgICAgICAg
ZnJvbSBwaWRmZF9zZW5kX3NpZ25hbDAxLmM6MTc6CnBpZGZkX3NlbmRfc2lnbmFsLmg6IEluIGZ1
bmN0aW9uICdjaGVja19zeXNjYWxsX3N1cHBvcnQnOgpwaWRmZF9zZW5kX3NpZ25hbC5oOjE2OjE0
OiBlcnJvcjogJ19fTlJfcGlkZmRfc2VuZF9zaWduYWwnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdfX05SX3BlcmZfZXZlbnRfb3Blbic/CiAg
dHN0X3N5c2NhbGwoX19OUl9waWRmZF9zZW5kX3NpZ25hbCk7CiAgICAgICAgICAgICAgXgouLi8u
Li8uLi8uLi9pbmNsdWRlL2xhcGkvc3lzY2FsbHMuaDozOTo2OiBub3RlOiBpbiBkZWZpbml0aW9u
IG9mIG1hY3JvICd0c3Rfc3lzY2FsbCcKICBpZiAoTlIgPT0gX19MVFBfX05SX0lOVkFMSURfU1lT
Q0FMTCkgeyBcCiAgICAgIF5+CnBpZGZkX3NlbmRfc2lnbmFsLmg6MTY6MTQ6IG5vdGU6IGVhY2gg
dW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5j
dGlvbiBpdCBhcHBlYXJzIGluCiAgdHN0X3N5c2NhbGwoX19OUl9waWRmZF9zZW5kX3NpZ25hbCk7
CiAgICAgICAgICAgICAgXgouLi8uLi8uLi8uLi9pbmNsdWRlL2xhcGkvc3lzY2FsbHMuaDozOTo2
OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvICd0c3Rfc3lzY2FsbCcKICBpZiAoTlIgPT0g
X19MVFBfX05SX0lOVkFMSURfU1lTQ0FMTCkgeyBcCiAgICAgIF5+CnBpZGZkX3NlbmRfc2lnbmFs
Lmg6IEluIGZ1bmN0aW9uICdwaWRmZF9zZW5kX3NpZ25hbCc6CnBpZGZkX3NlbmRfc2lnbmFsLmg6
MjM6MjE6IGVycm9yOiAnX19OUl9waWRmZF9zZW5kX3NpZ25hbCcgdW5kZWNsYXJlZCAoZmlyc3Qg
dXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ3BpZGZkX3NlbmRfc2lnbmFsJz8K
ICByZXR1cm4gdHN0X3N5c2NhbGwoX19OUl9waWRmZF9zZW5kX3NpZ25hbCwgcGlkZmQsIHNpZywg
aW5mbywgZmxhZ3MpOwogICAgICAgICAgICAgICAgICAgICBeCi4uLy4uLy4uLy4uL2luY2x1ZGUv
bGFwaS9zeXNjYWxscy5oOjM5OjY6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ3RzdF9z
eXNjYWxsJwogIGlmIChOUiA9PSBfX0xUUF9fTlJfSU5WQUxJRF9TWVNDQUxMKSB7IFwKICAgICAg
Xn4KbWFrZTogKioqIFs8YnVpbHRpbj46IHBpZGZkX3NlbmRfc2lnbmFsMDFdIEVycm9yIDEKCgpI
YXZlIHlvdSBmb3Jnb3R0ZW4gdG8gZ2l0IGFkZCB0aGUgKi5pbiBmaWxlcyB3aXRoIHN5c2NhbGwg
bnVtYmVycz8KCi0tIApDeXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
