Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD691B762F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 15:06:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7EA43C2908
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 15:06:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EE7733C28F5
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 15:06:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D059060101B
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 15:06:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6DC5DAC5B;
 Fri, 24 Apr 2020 13:06:23 +0000 (UTC)
Date: Fri, 24 Apr 2020 15:06:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200424130622.GA1656@dell5510>
References: <20200421180002.11351-1-pvorel@suse.cz>
 <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
 <20200424125349.GA31142@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424125349.GA31142@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/sendfile01.sh: Check with timeout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > > What bothers me more, that TST_NEEDS_CMDS does not check command on
> > > rhost. Do we want to have something like TST_NEEDS_CMDS_RHOST or we just
> > > don't care?

> > In general, yes, we need to check if a command exists on the remote host.
> > Yet another variable, what about checking what in TST_NEEDS_CMDS on the
> > remote host? Though TST_NEEDS_CMDS_RHOST looks quite well.

> Hm, looking on the implementation. tst_require_cmds() and tst_cmd_available()
> are functions, thus not runnable with tst_rhost_run(). We can add this code to
> custom shell script which checks or C code (shell has dependencies). Or any
> other idea?

BTW normally it works to load script and then run function.
$ cat foo.sh
#!/bin/sh
foo() { echo "foo: $$"; }

$ sh -c ". foo.sh; foo"
foo: 32479

But this somehow doesn't work for tst_net.sh:

diff --git testcases/lib/tst_net.sh testcases/lib/tst_net.sh
index 1ec03c738..728987f0b 100644
--- testcases/lib/tst_net.sh
+++ testcases/lib/tst_net.sh
@@ -57,6 +57,7 @@ tst_net_remote_tmpdir()
 
 tst_net_setup()
 {
+	tst_rhost_run -c ". tst_net.sh; tst_require_cmds $TST_NEEDS_CMDS"
 	tst_net_remote_tmpdir
 	[ -n "$TST_SETUP_CALLER" ] && $TST_SETUP_CALLER
 

results in:
/opt/ltp/testcases/bin/tst_net.sh: line 944: tst_cmd_available: command not found

tst_cmd_available() is needed for the end of tst_net.sh:
if [ -z "$TST_USE_LEGACY_API" ] && ! tst_cmd_available ping6; then
	ping6()
	{
		ping -6 $@
	}
	if [ -z "$_tst_net_ping6_warn_printed" ]; then
		tst_res_ TINFO "ping6 binary/symlink is missing, using workaround. Please, report missing ping6 to your distribution."
		export _tst_net_ping6_warn_printed=1
	fi
fi

=> sourcing of shell scripts with "." does not work on 'sh -c'.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
