Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4553DFAC7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 06:53:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60DE23C7FEB
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 06:53:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68E6B3C2BE3
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 06:52:58 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 03A21100037E
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 06:52:56 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 8322C1F43565
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Amir Goldstein <amir73il@gmail.com>
Organization: Collabora
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-7-krisman@collabora.com>
 <CAOQ4uxizX0ar7d9eYgazcenQcA7Ku7quEZOLbcaxKJiY0sTPLA@mail.gmail.com>
Date: Wed, 04 Aug 2021 00:52:52 -0400
In-Reply-To: <CAOQ4uxizX0ar7d9eYgazcenQcA7Ku7quEZOLbcaxKJiY0sTPLA@mail.gmail.com>
 (Amir Goldstein's message of "Tue, 3 Aug 2021 12:08:11 +0300")
Message-ID: <87k0l1hkuz.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/7] syscalls/fanotify20: Test file event with
 broken inode
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
>> This test corrupts an inode entry with an invalid mode through debugfs
>> and then tries to access it.  This should result in a ext4 error, which
>> we monitor through the fanotify group.
>>
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>> ---
>>  .../kernel/syscalls/fanotify/fanotify20.c     | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
>> index e7ced28eb61d..0c63e90edc3a 100644
>> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
>> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
>> @@ -76,6 +76,36 @@ static void trigger_fs_abort(void)
>>                    MS_REMOUNT|MS_RDONLY, "abort");
>>  }
>>
>> +#define TCASE2_BASEDIR "tcase2"
>> +#define TCASE2_BAD_DIR TCASE2_BASEDIR"/bad_dir"
>> +
>> +static unsigned int tcase2_bad_ino;
>> +static void tcase2_prepare_fs(void)
>> +{
>> +       struct stat stat;
>> +
>> +       SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BASEDIR, 0777);
>> +       SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BAD_DIR, 0777);
>> +
>> +       SAFE_STAT(MOUNT_PATH"/"TCASE2_BAD_DIR, &stat);
>> +       tcase2_bad_ino = stat.st_ino;
>> +
>> +       SAFE_UMOUNT(MOUNT_PATH);
>> +       do_debugfs_request(tst_device->dev, "sif " TCASE2_BAD_DIR " mode 0xff");
>> +       SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type, 0, NULL);
>> +}
>> +
>> +static void tcase2_trigger_lookup(void)
>> +{
>> +       int ret;
>> +
>> +       /* SAFE_OPEN cannot be used here because we expect it to fail. */
>> +       ret = open(MOUNT_PATH"/"TCASE2_BAD_DIR, O_RDONLY, 0);
>> +       if (ret != -1 && errno != EUCLEAN)
>> +               tst_res(TFAIL, "Unexpected lookup result(%d) of %s (%d!=%d)",
>> +                       ret, TCASE2_BAD_DIR, errno, EUCLEAN);
>> +}
>> +
>>  static const struct test_case {
>>         char *name;
>>         int error;
>> @@ -92,6 +122,14 @@ static const struct test_case {
>>                 .error_count = 1,
>>                 .error = EXT4_ERR_ESHUTDOWN,
>>                 .inode = NULL
>> +       },
>> +       {
>> +               .name = "Lookup of inode with invalid mode",
>> +               .prepare_fs = tcase2_prepare_fs,
>> +               .trigger_error = &tcase2_trigger_lookup,
>> +               .error_count = 1,
>> +               .error = 0,
>> +               .inode = &tcase2_bad_ino,
>
> Why is error 0?
> What's the rationale?

Hi Amir,

That is specific to Ext4.  Some ext4 conditions report bogus error codes.  I will
come up with a kernel patch changing it.

-- 
Gabriel Krisman Bertazi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
