Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE23118A4D
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 15:01:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 980F23C220F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 15:01:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 37D5A3C1814
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 15:01:50 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D913014052F9
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 15:01:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCB17B2BD
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 14:01:48 +0000 (UTC)
Date: Tue, 10 Dec 2019 15:01:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191210140146.GA1124@dell5510>
References: <20191206145517.3415-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206145517.3415-1-chrubis@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl01: Cleanup & convert to new library
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsCgpSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+ClRlc3Rl
ZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+CgpMR1RNLgoKQlRXIChub3QgcmVsYXRl
ZCB0byBpb2N0bDAxLmMpLCBpcyBpdCBwb3NzaWJsZSB0byBnZXQgcmlkIG9mIChmYWxzZSBwb3Np
dGl2ZSkgdGhpcyB3YXJuaW5nPwoKaW9jdGwwMS5jOjExNToxOiB3YXJuaW5nOiBtaXNzaW5nIGlu
aXRpYWxpemVyIGZvciBmaWVsZCDigJh0ZXN0X2FsbOKAmSBvZiDigJhzdHJ1Y3QgdHN0X3Rlc3Ti
gJkgWy1XbWlzc2luZy1maWVsZC1pbml0aWFsaXplcnNdCiB9OwogXgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gaW9jdGwwMS5jOjI1OjA6Ci4uLy4uLy4uLy4uL2luY2x1ZGUvdHN0X3Rlc3QuaDoxODU6
OTogbm90ZTog4oCYdGVzdF9hbGzigJkgZGVjbGFyZWQgaGVyZQogIHZvaWQgKCp0ZXN0X2FsbCko
dm9pZCk7CiAgICAgICAgIF5+fn5+fn5+CgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
