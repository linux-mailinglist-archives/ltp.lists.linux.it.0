Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78FA14CA5
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2025 10:57:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D17FB3C7C2C
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2025 10:57:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EE583C7C27
 for <ltp@lists.linux.it>; Fri, 17 Jan 2025 10:57:46 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DDED6140F6F0
 for <ltp@lists.linux.it>; Fri, 17 Jan 2025 10:57:44 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45AC721181;
 Fri, 17 Jan 2025 09:57:44 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18DFA139CB;
 Fri, 17 Jan 2025 09:57:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vhjGBJgpimdVcAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 17 Jan 2025 09:57:44 +0000
Date: Fri, 17 Jan 2025 10:57:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250117095742.GA749338@pevik>
References: <20250117084118.740225-1-pvorel@suse.cz>
 <Z4oln8S422XIUExH@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4oln8S422XIUExH@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 45AC721181
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/1] lib: Multiply slow config only for a real
 tests
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

> Hi!
> > This fixes errors on shell tests on netns backend (the default):

> >     # PATH="/opt/ltp/testcases/bin:$PATH" ping01.sh
> >     ...
> >     ping01 1 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
> >     /opt/ltp/testcases/bin/ping01.sh: 142: [: tst_kconfig.c:88:: unexpected operator
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     /opt/ltp/testcases/bin/ping01.sh: 142: [: tst_kconfig.c:88:: unexpected operator
> >     ping01 1 TINFO: add remote addr 10.0.0.1/24
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     /opt/ltp/testcases/bin/ping01.sh: 142: [: tst_kconfig.c:88:: unexpected operator
> >     ping01 1 TINFO: add remote addr fd00:1:1:1::1/64
> >     tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> >     tst_kconfig.c:667: TINFO: CONFIG_LATENCYTOP kernel option detected which might slow the execution
> >     /opt/ltp/testcases/bin/ping01.sh: 1: eval: tst_kconfig.c:88:: not found
> >     /opt/ltp/testcases/bin/ping01.sh: 1: eval: 34mTINFO:: not found
> >     /opt/ltp/testcases/bin/ping01.sh: 1: eval: 34mTINFO:: not found
> >     /opt/ltp/testcases/bin/ping01.sh: 142: [: tst_kconfig.c:88:: unexpected operator
> >     /opt/ltp/testcases/bin/ping01.sh: 1: eval: tst_kconfig.c:88:: not found
> >     /opt/ltp/testcases/bin/ping01.sh: 1: eval: 34mTINFO:: not found
> >     /opt/ltp/testcases/bin/ping01.sh: 1: eval: 34mTINFO:: not found
> >     ping01 1 TINFO: Network config (local -- remote):
> >     ping01 1 TINFO: ltp_ns_veth2 -- ltp_ns_veth1
> >     ping01 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24

> This looks like there is something fundamentally wrong there. If there
> is a TST_NO_DEFAULT_MAIN defined in the test, the test does not call
> tst_run_tcases() and the timeout shouln't be set up.

FYI tst_test.c:510 safe_clone(): call tst_multiply_timeout()

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
