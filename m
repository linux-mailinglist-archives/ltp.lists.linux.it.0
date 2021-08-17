Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B263EEBF0
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 13:53:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8CE03C57ED
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Aug 2021 13:53:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A8433C2304
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 13:53:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A7A2B60084A
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 13:53:35 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 19ADD1FF31
 for <ltp@lists.linux.it>; Tue, 17 Aug 2021 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629201215;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPJyG/CPJOtlQAkfmwDtpY9377+Mjrx21p/e5RQU/TM=;
 b=DlEUB5AXtvhqW9AVefAy4bdGUCeFkJv5sHGk0SnL8nv4Ydg96pkxitY77wt7Uf0C/+732E
 icPDEdXuHH3rH4RPgwpCxxDpp/wZDmhy8TTPrRfBre1XNyHlHCQicGEALQJbNUdwP/5VGw
 KoWN8+vBwWKHXgNSV9pjWEOtHrOdVKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629201215;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPJyG/CPJOtlQAkfmwDtpY9377+Mjrx21p/e5RQU/TM=;
 b=gJR+rxD/txAXLPhQF/hCVluU9Iu+cwDUh1Lh4Uuvf9G+lOnq3WSwSYyJHgaWxEgKGLzPfQ
 KxkDSeCDASHBOhAw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DA7D8A3B81;
 Tue, 17 Aug 2021 11:53:34 +0000 (UTC)
References: <20210806154557.19551-1-mdoucha@suse.cz>
 <20210806154557.19551-3-mdoucha@suse.cz> <87sfz8l68q.fsf@suse.de>
 <f1b416ce-cacf-55be-a7cd-bcff821d0ec7@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <f1b416ce-cacf-55be-a7cd-bcff821d0ec7@suse.cz>
Date: Tue, 17 Aug 2021 12:53:34 +0100
Message-ID: <87pmucl22p.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add test for CVE 2018-13405
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> On 17. 08. 21 12:23, Richard Palethorpe wrote:
>> Hello Martin,
>> 
>> Martin Doucha <mdoucha@suse.cz> writes:
>>> +static void setup(void)
>>> +{
>>> +	struct stat buf;
>>> +	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
>>> +	struct group *ltpgroup = SAFE_GETGRNAM("bin");
>> 
>> These might not exist on some systems. I think you can just pick
>> arbitrary UID/GID numbers instead. No need to check the user/group
>> databases.
>
> I'm planning to rewrite this test after the first two patches get
> merged. See previous discussion under the creat08 patch.

Ah, yes, sorry.

>
>
>>> +static void cleanup(void)
>>> +{
>>> +	SAFE_SETREUID(-1, orig_uid);
>> 
>> Why are you doing this? I am assuming the temp dir will be deleted by
>> the parent process.
>
> That assumption is incorrect.
>
> https://github.com/linux-test-project/ltp/commit/3833d44a2ba3773359d3b35a2108af691d75b4f9

This looks different as we call semctl in the cleanup callback. It
appears the testdir/tempdir cleanup is done from the parent
process. i.e. from do_exit() which is only called if pid == lib_pid.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
