Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 066073DFACC
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 06:54:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F23F3C7FEB
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 06:54:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A894A3C2BE3
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 06:54:15 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AA2151A00484
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 06:54:14 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id B56E21F43565
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Amir Goldstein <amir73il@gmail.com>
Organization: Collabora
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
Date: Wed, 04 Aug 2021 00:54:09 -0400
In-Reply-To: <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 (Amir Goldstein's message of "Tue, 3 Aug 2021 11:56:31 +0300")
Message-ID: <87fsvphksu.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
Cc: Ext4 <linux-ext4@vger.kernel.org>, kernel@collabora.com,
 Khazhismel Kumykov <khazhy@google.com>, LTP List <ltp@lists.linux.it>,
 Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Amir Goldstein <amir73il@gmail.com> writes:

> On Tue, Aug 3, 2021 at 12:47 AM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
>>
>> Verify the FID provided in the event.  If the testcase has a null inode,
>> this is assumed to be a superblock error (i.e. null FH).
>>
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> ---
>>  .../kernel/syscalls/fanotify/fanotify20.c     | 51 +++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
>> index fd5cfb8744f1..d8d788ae685f 100644
>> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
>> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
>> @@ -40,6 +40,14 @@
>>
>>  #define FAN_EVENT_INFO_TYPE_ERROR      4
>>
>> +#ifndef FILEID_INVALID
>> +#define        FILEID_INVALID          0xff
>> +#endif
>> +
>> +#ifndef FILEID_INO32_GEN
>> +#define FILEID_INO32_GEN       1
>> +#endif
>> +
>>  struct fanotify_event_info_error {
>>         struct fanotify_event_info_header hdr;
>>         __s32 error;
>> @@ -57,6 +65,9 @@ static const struct test_case {
>>         char *name;
>>         int error;
>>         unsigned int error_count;
>> +
>> +       /* inode can be null for superblock errors */
>> +       unsigned int *inode;
>
> Any reason not to use fanotify_fid_t * like fanotify16.c?

No reason other than I didn't notice they existed. Sorry. I will get
this fixed.

-- 
Gabriel Krisman Bertazi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
