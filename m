Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E746C2B1F96
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:07:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9FCB3C5FBB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:07:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D95733C2EB6
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:07:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 80BAE2009D9
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:07:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2762ABD9;
 Fri, 13 Nov 2020 16:07:36 +0000 (UTC)
Date: Fri, 13 Nov 2020 17:07:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20201113160735.GA8018@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] Failing Fedora rawhide (again)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

this time it's on autoconf broken:

    /usr/bin/autoconf: This script requires a shell more modern than all
    /usr/bin/autoconf: the shells that I found on your system.
    /usr/bin/autoconf: Please tell bug-autoconf@gnu.org about your system,
    /usr/bin/autoconf: including any error possibly output before this
    /usr/bin/autoconf: message. Then install a modern shell, or manually run
    /usr/bin/autoconf: the script under such a shell if you do have one.

I suspect this is just for docker image (I remember some discussion on github,
but cannot find anything at [1] now).

I checked autoconf file and it's perfectly ok, thus I'll downgrade to Fedora
latest (33). I like rawhide for newest software (together with Tumbleweed),
but it must be working.

Kind regards,
Petr

[1] https://github.com/fedora-cloud/docker-brew-fedora/issues

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
