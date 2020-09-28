Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85B27AA1E
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 11:00:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B4B73C4CAF
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Sep 2020 11:00:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C80503C04C3
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 11:00:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CDEDB1000955
 for <ltp@lists.linux.it>; Mon, 28 Sep 2020 11:00:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21EFDADA8;
 Mon, 28 Sep 2020 09:00:11 +0000 (UTC)
References: <20200925121941.10475-1-rpalethorpe@suse.com>
 <CAEemH2eo6qVt0D36QVDFeW_2csWFEDnnghxRjd3_Ysu=CD-8Hw@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2eo6qVt0D36QVDFeW_2csWFEDnnghxRjd3_Ysu=CD-8Hw@mail.gmail.com>
Date: Mon, 28 Sep 2020 10:00:10 +0100
Message-ID: <87y2kuwa1x.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH] tst_cgroup: Attempt to use CGroups V2 then
 V1 instead of guessing
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

>>
>> -static void tst_cgroup2_mount(const char *mnt_path, const char *new_path)
>> +static int cgroup2_mount(const char *mnt_path, const char *new_path)
>>
>
> We'd like to make the series function name starts with tst_*.
>

The idea is this will be an internal/static function and
tst_cgroup2_mount will be a public function if it is needed. I guess
that eventually there will be features only available in cgroup2, in
which case the test author will want to call tst_cgroup2_mount not
tst_cgroup_mount and they will just want it to fail with tst_brk if
cgroup2 can't be mounted.

Infact, if the user wants cpuset or some other V1 only controller, then
they should probably call tst_cgroup1_mount. AFAICT some of these
controllers will not be moved to V2. OTOH a functionally similar feature
may be available in V2, but with a different interface. There is a
difference between requiring a specific controller to test it and
needing some functionality without caring how it is provided.

So I suggest providing an API for mounting specific cgroup versions and
controllers and an API to mount specific controllers of either version
(i.e. tst_cgroup_mount). Then we can create helper functions to provide
functionality without caring how it is achieved, if we need to do that.

Other comments sound good! I will try creating another patch with
diagnostics.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
