Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6334D663
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 19:56:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEC833C8CEA
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 19:56:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F220C3C1A25
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 19:56:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6CE9C1400E56
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 19:56:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8FFFAFD2;
 Mon, 29 Mar 2021 17:56:51 +0000 (UTC)
Date: Mon, 29 Mar 2021 19:56:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YGIU4uDm68QSXEk5@pevik>
References: <20210315092844.991073-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315092844.991073-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] pec: Convert to the new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> +++ b/testcases/kernel/connectors/pec/cn_pec.sh
...
> +	# Run with absolute path, so the generator can exec itself
> +	generator="$(command -v event_generator)"
> +	"$generator" -n $NUM_EVENTS -e $event >gen_$event.log 2>gen_$event.err
> +	gen_rc=$?
...
I suggest to use "p" exec family - event_generator will be always installed into
$LTPROOT/testcases/bin => drop command. And for development (running without
make install), there should be always also test directory in PATH.

> +++ b/testcases/kernel/connectors/pec/event_generator.c
...
> -#include "test.h"
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"

> -	execv(exec_argv[0], exec_argv);
> +	/* Note: This expects the full path to self in exec_argv[0]! */
> +	SAFE_EXECV(exec_argv[0], exec_argv);
We don't have this yet. But I've sent patch [1] which adds SAFE_EXECVP()
because of expecting command to be in PATH.

There are more changes suggested:
* use ROD where possible (cannot be used for wait, because it's not a binary but
  a shell command)
* remove useless exit 0
* add missing local

The rest LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210329174135.23890-1-pvorel@suse.cz/

--- testcases/kernel/connectors/pec/cn_pec.sh
+++ testcases/kernel/connectors/pec/cn_pec.sh
@@ -23,7 +23,6 @@ setup()
 {
 	if ! grep -q cn_proc /proc/net/connector; then
 		tst_brk TCONF "Process Event Connector is not supported or kernel is below 2.6.26"
-		exit 0;
 	fi
 
 	tst_res TINFO "Test process events connector"
@@ -32,15 +31,15 @@ setup()
 test()
 {
 	local event=$2
-	pec_listener >lis_$event.log 2>lis_$event.err &
+	local expected_events pid
+
+	ROD pec_listener \>lis_$event.log 2\>lis_$event.err &
 	pid=$!
 	# Wait for pec_listener to start listening
 	tst_sleep 100ms
 
-	# Run with absolute path, so the generator can exec itself
-	generator="$(command -v event_generator)"
-	"$generator" -n $NUM_EVENTS -e $event >gen_$event.log 2>gen_$event.err
-	gen_rc=$?
+	# generator must be in PATH
+	ROD event_generator -n $NUM_EVENTS -e $event \>gen_$event.log 2\>gen_$event.err
 
 	# Sleep until pec_listener has seen and handled all of the generated events
 	tst_sleep 100ms
@@ -48,7 +47,7 @@ test()
 	wait $pid
 	lis_rc=$?
 
-	if [ $gen_rc -ne 0 -o ! -s gen_$event.log ]; then
+	if [ ! -s gen_$event.log ]; then
 		tst_brk TBROK "failed to generate process events"
 	fi
 
diff --git testcases/kernel/connectors/pec/event_generator.c testcases/kernel/connectors/pec/event_generator.c
index f041341f9..f374688ba 100644
--- testcases/kernel/connectors/pec/event_generator.c
+++ testcases/kernel/connectors/pec/event_generator.c
@@ -86,7 +86,7 @@ static void gen_exec(void)
 	fflush(stdout);
 
 	/* Note: This expects the full path to self in exec_argv[0]! */
-	SAFE_EXECV(exec_argv[0], exec_argv);
+	SAFE_EXECVP(exec_argv[0], exec_argv);
 }
 
 /*

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
