Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38D2B9214
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:10:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6B573C5F5A
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 13:10:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F3CE43C25DB
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:10:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3418E20093E
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 13:09:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DDBDABD6
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 12:09:43 +0000 (UTC)
Date: Thu, 19 Nov 2020 13:10:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201119121032.GI2785@yuki.lan>
References: <20201119115230.8829-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119115230.8829-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] Add tst_kconfig_get() helper function
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +/**
> + * Checks kernel config for a single configuration option and returns its
> + * state if found. The possible return values are the same as for
> + * tst_kconfig_var.choice, with the same meaning. See tst_kconfig_read()
> + * description for details.
> + *
> + * @param confname The configuration option name to search for.
> + */
> +char tst_kconfig_get(const char *confname);

I do not like this interface at all since the whole kernel config is
parsed every time this function is called and I bet that people would
call it five times in a test setup() soon enough.

I guess that if you want easier interface than the tst_kconfig_read() it
should be implemented as:

* A function loads config given an array of variable names to store.
  Either it should return a handle or store the pointer to newly
  allocated data to a global variable.

* A set of functions that return variable value given variable name

* A function that frees the memory once we are done

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
