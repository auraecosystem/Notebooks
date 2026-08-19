/* icu-uc.v - Vala API bindings (VAPI) for ICU Common (icu-uc) C Library */

[CCode (cprefix = "U", lower_case_cprefix = "u_", cheader_filename = "unicode/utypes.h,unicode/ustring.h,unicode/unorm2.h,unicode/uidna.h,unicode/uchar.h")]
namespace ICU {

    /* --- Status Codes & Error Handling --- */

    [CCode (cname = "UErrorCode", cprefix = "U_")]
    public enum ErrorCode {
        ZERO_ERROR,
        ILLEGAL_ARGUMENT_ERROR,
        MISSING_RESOURCE_ERROR,
        INVALID_FORMAT_ERROR,
        FILE_ACCESS_ERROR,
        INTERNAL_PROGRAM_ERROR,
        MESSAGE_PARSE_ERROR,
        MEMORY_ALLOCATION_ERROR,
        INDEX_OUTOFBOUNDS_ERROR,
        PARSE_ERROR,
        INVALID_CHAR_FOUND,
        TRUNCATED_CHAR_FOUND,
        ILLEGAL_CHAR_FOUND,
        BUFFER_OVERFLOW_ERROR,
        STRING_NOT_TERMINATED_WARNING;

        public inline bool is_failure () {
            return (int) this > 0;
        }

        public inline bool is_success () {
            return (int) this <= 0;
        }

        public unowned string to_string () {
            return u_errorName (this);
        }
    }

    [CCode (cname = "u_errorName")]
    public unowned string u_errorName (ErrorCode code);

    /* --- Unicode Normalization (unorm2.h) --- */

    [CCode (cname = "UNormalizer2", free_function = "unorm2_close", has_type_id = false)]
    public class Normalizer2 {
        [CCode (cname = "unorm2_getNFCInstance")]
        public static unowned Normalizer2? get_nfc_instance (out ErrorCode err);

        [CCode (cname = "unorm2_getNFKCInstance")]
        public static unowned Normalizer2? get_nfkc_instance (out ErrorCode err);

        [CCode (cname = "unorm2_getNFKDInstance")]
        public static unowned Normalizer2? get_nfkd_instance (out ErrorCode err);

        [CCode (cname = "unorm2_normalizeUTF8")]
        public int normalize_utf8 (
            uint32 options,
            [CCode (array_length = false)] uint8[] src,
            int32 src_length,
            [CCode (array_length = false)] uint8[] dest,
            int32 capacity,
            out ErrorCode err
        );

        [CCode (cname = "unorm2_isNormalizedUTF8")]
        public bool is_normalized_utf8 (
            [CCode (array_length = false)] uint8[] src,
            int32 length,
            out ErrorCode err
        );
    }

    /* --- Internationalized Domain Names in Applications (uidna.h) --- */

    [CCode (cname = "UIDNAInfo", has_type_id = false)]
    public struct IDNAInfo {
        public uint32 size;
        public bool isTransitionalDifferent;
        public uint32 errors;
    }

    [CCode (cname = "UIDNA", free_function = "uidna_close", has_type_id = false)]
    public class IDNA {
        [CCode (cname = "uidna_openUTS46")]
        public static IDNA? open_uts46 (uint32 options, out ErrorCode err);

        [CCode (cname = "uidna_nameToASCII_UTF8")]
        public int name_to_ascii_utf8 (
            [CCode (array_length = false)] uint8[] name,
            int32 length,
            [CCode (array_length = false)] uint8[] dest,
            int32 capacity,
            out IDNAInfo info,
            out ErrorCode err
        );

        [CCode (cname = "uidna_nameToUnicodeUTF8")]
        public int name_to_unicode_utf8 (
            [CCode (array_length = false)] uint8[] name,
            int32 length,
            [CCode (array_length = false)] uint8[] dest,
            int32 capacity,
            out IDNAInfo info,
            out ErrorCode err
        );
    }

    /* --- String Transformation & UTF Conversions (ustring.h) --- */

    [CCode (cname = "u_strToUTF8")]
    public static unowned string str_to_utf8 (
        [CCode (array_length = false)] uint8[] dest,
        int32 dest_capacity,
        out int32 dest_len,
        [CCode (array_length = false)] uint16[] src,
        int32 src_len,
        out ErrorCode err
    );

    [CCode (cname = "u_strFromUTF8")]
    public static unowned uint16* str_from_utf8 (
        [CCode (array_length = false)] uint16[] dest,
        int32 dest_capacity,
        out int32 dest_len,
        [CCode (array_length = false)] uint8[] src,
        int32 src_len,
        out ErrorCode err
    );
}
