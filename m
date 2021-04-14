Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD235FAC0
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 20:34:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 945973C712B
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 20:34:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3EDDA3C70F0
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 20:34:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 79A41140116D
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 20:34:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B08EFAE06;
 Wed, 14 Apr 2021 18:34:26 +0000 (UTC)
Date: Wed, 14 Apr 2021 20:34:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YHc1sffWE/P2+dFw@pevik>
References: <20210414182850.23308-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414182850.23308-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] travis: Fix openSUSE Tumbleweed
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
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpzdGlsbCBzb21lIGVycm9ycyBmb3IgcG9kbWFuWzFdOgoKJCBzdWRvICRDT05UQUlORVIg
cnVuICRDT05UQUlORVJfQVJHUyAtdCBpbWEtZXZtLXV0aWxzIC9iaW4vc2ggLWMgImNkIHRyYXZp
cyAmJiBpZiBbIFwiJFZBUklBTlRcIiBdOyB0aGVuIEFSQ0g9XCIkQVJDSFwiIC4vJElOU1RBTEwu
JFZBUklBTlQuc2g7IGZpICYmIEFSQ0g9XCIkQVJDSFwiIENDPVwiJENDXCIgVFNTPVwiJFRTU1wi
IC4vJElOU1RBTEwuc2ggJiYgaWYgWyAhIFwiJFZBUklBTlRcIiBdOyB0aGVuIHdoaWNoIHRwbV9z
ZXJ2ZXIgfHwgd2hpY2ggc3d0cG0gfHwgLi4vdGVzdHMvaW5zdGFsbC1zd3RwbS5zaDsgZmkgJiYg
Q0M9XCIkQ0NcIiBWQVJJQU5UPVwiJFZBUklBTlRcIiAuLi9idWlsZC5zaCIKV0FSTlswMDAxXSBF
cnJvciB2YWxpZGF0aW5nIENOSSBjb25maWcgZmlsZSAvZXRjL2NuaS9uZXQuZC84Ny1wb2RtYW4t
YnJpZGdlLmNvbmZsaXN0OiBbCmZhaWxlZCB0byBmaW5kIHBsdWdpbiAiYnJpZGdlIiBpbiBwYXRo
IFsvdXNyL2xpYmV4ZWMvY25pIC91c3IvbGliL2NuaSAvdXNyL2xvY2FsL2xpYi9jbmkgL29wdC9j
bmkvYmluXQpmYWlsZWQgdG8gZmluZCBwbHVnaW4gInBvcnRtYXAiIGluIHBhdGggWy91c3IvbGli
ZXhlYy9jbmkgL3Vzci9saWIvY25pIC91c3IvbG9jYWwvbGliL2NuaSAvb3B0L2NuaS9iaW5dCmZh
aWxlZCB0byBmaW5kIHBsdWdpbiAiZmlyZXdhbGwiIGluIHBhdGggWy91c3IvbGliZXhlYy9jbmkg
L3Vzci9saWIvY25pIC91c3IvbG9jYWwvbGliL2NuaSAvb3B0L2NuaS9iaW5dCmZhaWxlZCB0byBm
aW5kIHBsdWdpbiAidHVuaW5nIiBpbiBwYXRoIFsvdXNyL2xpYmV4ZWMvY25pIC91c3IvbGliL2Nu
aSAvdXNyL2xvY2FsL2xpYi9jbmkgL29wdC9jbmkvYmluXV0KCj8gUGxlYXNlIHNlbGVjdCBhbiBp
bWFnZToK4pa4IGRvY2tlci5pby9saWJyYXJ5L2ltYS1ldm0tdXRpbHM6bGF0ZXN0CiAgcXVheS5p
by9pbWEtZXZtLXV0aWxzOmxhdGVzdAoKU29ycnkgZm9yIG92ZXJsb29raW5nIGl0LgoKS2luZCBy
ZWdhcmRzLApQZXRyCgpbMV0gaHR0cHM6Ly90cmF2aXMtY2kub3JnL2dpdGh1Yi9wZXZpay9pbWEt
ZXZtLXV0aWxzL2pvYnMvNzYyMTcwMjIwI0w0OTEKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
