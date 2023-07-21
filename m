Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CD75CDDC
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jul 2023 18:15:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D9103C94BA
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jul 2023 18:15:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 312723C9422
 for <ltp@lists.linux.it>; Fri, 21 Jul 2023 18:15:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4A7DB1A000B0
 for <ltp@lists.linux.it>; Fri, 21 Jul 2023 18:15:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9B33218E3;
 Fri, 21 Jul 2023 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689956117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=893DSRE7aZ9gu/OfUgulkNpFt1xhMXrfw3y4j2G2d9Q=;
 b=BIipULa5IOiQjk4WwVVyFAF5F6d6VUa/o0v901Qp+578EPwwXtipDh+us6QAkmjQ5gstkD
 7J8kAFRulTDQnT9gK/QB1GeY3wOr5BLywlcOit30oDNKUEUuCvjynP0IL9U/dE2erWoKEm
 HWycEgrWFhcd2moBg8wKBzNZD9+aTcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689956117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=893DSRE7aZ9gu/OfUgulkNpFt1xhMXrfw3y4j2G2d9Q=;
 b=3Epz6gTAwWYt8ffUV0atgGDLg7iNrz8o6ImVu7s4C/AjJX77/yFKTcnULEHHqiVP4EFxGX
 z3zaFFXoKGsLClBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2367E134B0;
 Fri, 21 Jul 2023 16:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XVvMBBWvumQaQQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Jul 2023 16:15:17 +0000
From: Petr Vorel <pvorel@suse.cz>
To: chrubis@suse.cz
Date: Fri, 21 Jul 2023 18:14:58 +0200
Message-Id: <20230721161458.1464841-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719103743.4775-3-chrubis@suse.cz>
References: <20230719103743.4775-3-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] sched/rt: sysctl_sched_rr_timeslice show
 default timeslice after reset
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
Cc: juri.lelli@redhat.com, jbohac@suse.cz, vincent.guittot@linaro.org,
 peterz@infradead.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 bsegall@google.com, mingo@redhat.com, mgorman@suse.de, vschneid@redhat.com,
 bristot@redhat.com, dietmar.eggemann@arm.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
