Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EF3AADEC
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:45:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF4823C71B9
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:45:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 712E73C2DD7
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:45:07 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C998B200DCA
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:45:06 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 36E9B1FDBF;
 Thu, 17 Jun 2021 07:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623915906;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f1dwLtYzK1DS4O715Ql0BtW/zlP8Chq+3SABwCJIztY=;
 b=SVNO14RH+m9Tb5sDcyLLb/w7yowwxY31eKsmVZLpPRsmGQMipRAs0NXbYyAJcrFbpADt9w
 Yyw/MqRhVHa1WzOLtrbt0UIcQZW/AwHIGLry8J7Ooqzy8+9rKCM8KTQoK4Ktl2blbx8PSu
 mIyPrdok3pZWKYgsb2LIHrvBMLyTFYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623915906;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f1dwLtYzK1DS4O715Ql0BtW/zlP8Chq+3SABwCJIztY=;
 b=VdRFLuqktFokaJtCIQGAoqFlNH7oihAzptnWe0uhnYEKye05FeN6pESwqKLeMqj38vFoAD
 c3voc2N54/fu4dCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AED4BA3BB4;
 Thu, 17 Jun 2021 07:45:05 +0000 (UTC)
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-2-rpalethorpe@suse.com>
 <CAEemH2eNrTa_wNZhPGNhRPgeF3yQFE8pNXOiPuZa3D0x9s=EnQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2eNrTa_wNZhPGNhRPgeF3yQFE8pNXOiPuZa3D0x9s=EnQ@mail.gmail.com>
Date: Thu, 17 Jun 2021 08:45:05 +0100
Message-ID: <87fsxh3pfi.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/3] API: Remove TEST macro usage from library
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> Hi Richard,
>
>
> On Tue, Jun 15, 2021 at 3:41 PM Richard Palethorpe via ltp
> <ltp@lists.linux.it> wrote:
>>
>> The test author is guaranteed that the LTP library will not change the
>> TST_RET and TST_ERR global variables. That way the test author can use
>> the TEST macro then call other library functions before using TST_RET,
>> TST_ERR or TTERRNO.
>
> I guess the inline function in the header files also should be
> considered, right?
>
> lapi/clone.h:           TEST(syscall(__NR_clone3, NULL, 0));
> lapi/fsmount.h:         TEST(syscall(__NR_fsopen, NULL, 0));
> lapi/init_module.h:               TEST(syscall(__NR_finit_module, 0, "", 0));
> lapi/io_uring.h:                TEST(syscall(__NR_io_uring_setup, NULL, 0));
> lapi/name_to_handle_at.h:       TEST(name_to_handle_at(dfd, pathname,
> &fh, &mount_id, 0));
> lapi/openat2.h:         TEST(syscall(__NR_openat2, -1, NULL, NULL, 0));

Yes, I guess we need to explicitly scan the headers. Thanks!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
